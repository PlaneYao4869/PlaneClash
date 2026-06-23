1|1|import 'package:fl_clash/common/common.dart';
2|2|import 'package:fl_clash/enum/enum.dart';
3|3|import 'package:fl_clash/models/whitelist.dart';
4|4|import 'package:fl_clash/models/process_whitelist.dart';
5|5|import 'package:fl_clash/providers/providers.dart';
6|6|import 'package:fl_clash/state.dart';
7|7|import 'package:fl_clash/widgets/widgets.dart';
8|8|import 'package:file_picker/file_picker.dart';
9|9|import 'package:flutter/material.dart';
10|10|import 'package:flutter_riverpod/flutter_riverpod.dart';
11|11|import 'package:path/path.dart' as p;
12|12|
13|13|class WhitelistPage extends ConsumerStatefulWidget {
14|14|  const WhitelistPage({super.key});
15|15|
16|16|  @override
17|17|  ConsumerState<WhitelistPage> createState() => _WhitelistPageState();
18|18|}
19|19|
20|20|class _WhitelistPageState extends ConsumerState<WhitelistPage>
21|21|    with SingleTickerProviderStateMixin {
22|22|  late TabController _tabController;
23|23|
24|24|  @override
25|25|  void initState() {
26|26|    super.initState();
27|27|    _tabController = TabController(length: 2, vsync: this);
28|28|  }
29|29|
30|30|  @override
31|31|  void dispose() {
32|32|    _tabController.dispose();
33|33|    super.dispose();
34|34|  }
35|35|
36|36|  @override
37|37|  Widget build(BuildContext context) {
38|38|    final appLocalizations = context.appLocalizations;
39|39|
40|40|    return Scaffold(
41|41|      appBar: AppBar(
42|42|        title: Text(appLocalizations.whitelistManagement),
43|43|        bottom: TabBar(
44|44|          controller: _tabController,
45|45|          tabs: const [
46|46|            Tab(text: '域名白名单', icon: Icon(Icons.language)),
47|47|            Tab(text: '进程白名单', icon: Icon(Icons.apps)),
48|48|          ],
49|49|        ),
50|50|      ),
51|51|      body: TabBarView(
52|52|        controller: _tabController,
53|53|        children: const [
54|54|          DomainWhitelistTab(),
55|55|          ProcessWhitelistTab(),
56|56|        ],
57|57|      ),
58|58|    );
59|59|  }
60|60|}
61|61|
62|62|class DomainWhitelistTab extends ConsumerStatefulWidget {
63|63|  const DomainWhitelistTab({super.key});
64|64|
65|65|  @override
66|66|  ConsumerState<DomainWhitelistTab> createState() => _DomainWhitelistTabState();
67|67|}
68|68|
69|69|class _DomainWhitelistTabState extends ConsumerState<DomainWhitelistTab> {
70|70|  final _domainController = TextEditingController();
71|71|  final _descriptionController = TextEditingController();
72|72|
73|73|  @override
74|74|  void dispose() {
75|75|    _domainController.dispose();
76|76|    _descriptionController.dispose();
77|77|    super.dispose();
78|78|  }
79|79|
80|80|  Future<void> _handleAdd() async {
81|81|    final appLocalizations = context.appLocalizations;
82|82|    _domainController.clear();
83|83|    _descriptionController.clear();
84|84|
85|85|    final result = await showDialog<Whitelist>(
86|86|      context: context,
87|87|      builder: (context) => AlertDialog(
88|88|        title: Text(appLocalizations.addWhitelist),
89|89|        content: Column(
90|90|          mainAxisSize: MainAxisSize.min,
91|91|          children: [
92|92|            TextField(
93|93|              controller: _domainController,
94|94|              decoration: InputDecoration(
95|95|                labelText: appLocalizations.domainName,
96|96|                hintText: '例如: baidu.com',
97|97|                border: const OutlineInputBorder(),
98|98|              ),
99|99|              autofocus: true,
100|100|            ),
101|101|            const SizedBox(height: 16),
102|102|            TextField(
103|103|              controller: _descriptionController,
104|104|              decoration: InputDecoration(
105|105|                labelText: appLocalizations.descriptionOptional,
106|106|                hintText: '例如: 百度搜索',
107|107|                border: const OutlineInputBorder(),
108|108|              ),
109|109|            ),
110|110|          ],
111|111|        ),
112|112|        actions: [
113|113|          TextButton(
114|114|            onPressed: () => Navigator.of(context).pop(),
115|115|            child: Text(appLocalizations.cancel),
116|116|          ),
117|117|          FilledButton(
118|118|            onPressed: () {
119|119|              final domain = _domainController.text.trim();
120|120|              if (domain.isEmpty) {
121|121|                ScaffoldMessenger.of(context).showSnackBar(
122|122|                  const SnackBar(content: Text('请输入域名')),
123|123|                );
124|124|                return;
125|125|              }
126|126|              Navigator.of(context).pop(
127|127|                Whitelist.create(
128|128|                  domain: domain,
129|129|                  description: _descriptionController.text.trim().isEmpty
130|130|                      ? null
131|131|                      : _descriptionController.text.trim(),
132|132|                ),
133|133|              );
134|134|            },
135|135|            child: Text(appLocalizations.add),
136|136|          ),
137|137|        ],
138|138|      ),
139|139|    );
140|140|
141|141|    if (result != null) {
142|142|      ref.read(whitelistsProvider.notifier).addWhitelist(result);
143|143|    }
144|144|  }
145|145|
146|146|  Future<void> _handleImportCommon() async {
147|147|    final commonDomains = [
148|148|      'baidu.com', 'bilibili.com', 'taobao.com', 'jd.com',
149|149|      'weibo.com', 'zhihu.com', 'douyin.com', 'qq.com',
150|150|      'weixin.qq.com', '163.com', '126.com', 'sina.com',
151|151|      'csdn.net', 'github.com', 'gitee.com', 'aliyun.com',
152|152|      'tencent.com', 'huawei.com', 'xiaomi.com', 'apple.com',
153|153|    ];
154|154|
155|155|    final confirmed = await showDialog<bool>(
156|156|      context: context,
157|157|      builder: (context) => AlertDialog(
158|158|        title: Text(context.appLocalizations.importCommonWebsites),
159|159|        content: Text('将导入 ${commonDomains.length} 个常见国内网站到白名单'),
160|160|        actions: [
161|161|          TextButton(
162|162|            onPressed: () => Navigator.of(context).pop(false),
163|163|            child: Text(context.appLocalizations.cancel),
164|164|          ),
165|165|          FilledButton(
166|166|            onPressed: () => Navigator.of(context).pop(true),
167|167|            child: Text(context.appLocalizations.confirm),
168|168|          ),
169|169|        ],
170|170|      ),
171|171|    );
172|172|
173|173|    if (confirmed == true) {
174|174|      final whitelists = commonDomains.map((d) => Whitelist.create(domain: d)).toList();
175|175|      ref.read(whitelistsProvider.notifier).addWhitelists(whitelists);
176|176|    }
177|177|  }
178|178|
179|179|  @override
180|180|  Widget build(BuildContext context) {
181|181|    final whitelists = ref.watch(whitelistsProvider);
182|182|    final appLocalizations = context.appLocalizations;
183|183|
184|184|    return Scaffold(
185|185|      body: whitelists.isEmpty
186|186|          ? Center(
187|187|              child: Column(
188|188|                mainAxisAlignment: MainAxisAlignment.center,
189|189|                children: [
190|190|                  const Icon(Icons.list_alt, size: 64, color: Colors.grey),
191|191|                  const SizedBox(height: 16),
192|192|                  Text(appLocalizations.noWhitelistDomains),
193|193|                ],
194|194|              ),
195|195|            )
196|196|          : ListView.builder(
197|197|              padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
198|198|              itemCount: whitelists.length,
199|199|              itemBuilder: (context, index) {
200|200|                final item = whitelists[index];
201|201|                return Card(
202|202|                  child: ListTile(
203|203|                    leading: const Icon(Icons.language),
204|204|                    title: Text(item.domain),
205|205|                    subtitle: item.description != null ? Text(item.description!) : null,
206|206|                    trailing: Row(
207|207|                      mainAxisSize: MainAxisSize.min,
208|208|                      children: [
209|209|                        Switch(
210|210|                          value: item.enabled,
211|211|                          onChanged: (value) {
212|212|                            ref.read(whitelistsProvider.notifier)
213|213|                                .updateWhitelist(item.copyWith(enabled: value));
214|214|                          },
215|215|                        ),
216|216|                        IconButton(
217|217|                          icon: const Icon(Icons.delete),
218|218|                          onPressed: () => ref.read(whitelistsProvider.notifier).deleteWhitelist(item.id),
219|219|                        ),
220|220|                      ],
221|221|                    ),
222|222|                  ),
223|223|                );
224|224|              },
225|225|            ),
226|226|      floatingActionButton: Column(
227|227|        mainAxisSize: MainAxisSize.min,
228|228|        children: [
229|229|          FloatingActionButton.small(
230|230|            heroTag: 'import',
231|231|            onPressed: _handleImportCommon,
232|232|            child: const Icon(Icons.download),
233|233|          ),
234|234|          const SizedBox(height: 8),
235|235|          FloatingActionButton(
236|236|            heroTag: 'add',
237|237|            onPressed: _handleAdd,
238|238|            child: const Icon(Icons.add),
239|239|          ),
240|240|        ],
241|241|      ),
242|242|    );
243|243|  }
244|244|}
245|245|
246|246|class ProcessWhitelistTab extends ConsumerStatefulWidget {
247|247|  const ProcessWhitelistTab({super.key});
248|248|
249|249|  @override
250|250|  ConsumerState<ProcessWhitelistTab> createState() => _ProcessWhitelistTabState();
251|251|}
252|252|
253|253|class _ProcessWhitelistTabState extends ConsumerState<ProcessWhitelistTab> {
254|254|  Future<void> _handleAddProcess() async {
255|255|    final appLocalizations = context.appLocalizations;
256|256|    
257|257|    final result = await FilePicker.pickFiles(
258|258|      type: FileType.custom,
259|259|      allowedExtensions: ['exe'],
260|260|      dialogTitle: '选择要直连的程序',
261|261|    );
262|262|
263|263|    if (result == null || result.files.isEmpty) return;
264|264|
265|265|    final file = result.files.first;
266|266|    final exePath = file.path!;
267|267|    final processName = p.basename(exePath);
268|268|
269|269|    final existing = ref.read(processWhitelistsProvider);
270|270|    if (existing.any((item) => item.processName == processName)) {
271|271|      if (mounted) {
272|272|        ScaffoldMessenger.of(context).showSnackBar(
273|273|          SnackBar(content: Text('$processName 已在白名单中')),
274|274|        );
275|275|      }
276|276|      return;
277|277|    }
278|278|
279|279|    final descriptionController = TextEditingController();
280|280|    final confirmed = await showDialog<bool>(
281|281|      context: context,
282|282|      builder: (context) => AlertDialog(
283|283|        title: const Text('添加进程白名单'),
284|284|        content: Column(
285|285|          mainAxisSize: MainAxisSize.min,
286|286|          crossAxisAlignment: CrossAxisAlignment.start,
287|287|          children: [
288|288|            Text('程序: $processName'),
289|289|            const SizedBox(height: 8),
290|290|            Text('路径: $exePath', style: const TextStyle(fontSize: 12, color: Colors.grey)),
291|291|            const SizedBox(height: 16),
292|292|            TextField(
293|293|              controller: descriptionController,
294|294|              decoration: const InputDecoration(
295|295|                labelText: '描述（可选）',
296|296|                hintText: '例如: 微信',
297|297|                border: OutlineInputBorder(),
298|298|              ),
299|299|            ),
300|300|          ],
301|301|        ),
302|302|        actions: [
303|303|          TextButton(
304|304|            onPressed: () => Navigator.of(context).pop(false),
305|305|            child: Text(appLocalizations.cancel),
306|306|          ),
307|307|          FilledButton(
308|308|            onPressed: () => Navigator.of(context).pop(true),
309|309|            child: const Text('添加'),
310|310|          ),
311|311|        ],
312|312|      ),
313|313|    );
314|314|
315|315|    if (confirmed == true) {
316|316|      ref.read(processWhitelistsProvider.notifier).addProcessWhitelist(
317|317|        ProcessWhitelist.create(
318|318|          processName: processName,
319|319|          exePath: exePath,
320|320|          description: descriptionController.text.trim().isEmpty
321|321|              ? null
322|322|              : descriptionController.text.trim(),
323|323|        ),
324|324|      );
325|325|    }
326|326|  }
327|327|
328|328|  Future<void> _handleDelete(int id) async {
329|329|    final confirmed = await showDialog<bool>(
330|330|      context: context,
331|331|      builder: (context) => AlertDialog(
332|332|        title: const Text('确认删除'),
333|333|        content: const Text('删除后该程序将恢复走代理'),
334|334|        actions: [
335|335|          TextButton(
336|336|            onPressed: () => Navigator.of(context).pop(false),
337|337|            child: Text(context.appLocalizations.cancel),
338|338|          ),
339|339|          FilledButton(
340|340|            onPressed: () => Navigator.of(context).pop(true),
341|341|            child: Text(context.appLocalizations.confirm),
342|342|          ),
343|343|        ],
344|344|      ),
345|345|    );
346|346|
347|347|    if (confirmed == true) {
348|348|      ref.read(processWhitelistsProvider.notifier).deleteProcessWhitelist(id);
349|349|    }
350|350|  }
351|351|
352|352|  @override
353|353|  Widget build(BuildContext context) {
354|354|    final processWhitelists = ref.watch(processWhitelistsProvider);
355|355|
356|356|    return Scaffold(
357|357|      body: processWhitelists.isEmpty
358|358|          ? const Center(
359|359|              child: Column(
360|360|                mainAxisAlignment: MainAxisAlignment.center,
361|361|                children: [
362|362|                  Icon(Icons.apps, size: 64, color: Colors.grey),
363|363|                  SizedBox(height: 16),
364|364|                  Text('暂无进程白名单'),
365|365|                  SizedBox(height: 8),
366|366|                  Text('点击右下角 + 添加要直连的程序', style: TextStyle(color: Colors.grey)),
367|367|                ],
368|368|              ),
369|369|            )
370|370|          : ListView.builder(
371|371|              padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
372|372|              itemCount: processWhitelists.length,
373|373|              itemBuilder: (context, index) {
374|374|                final item = processWhitelists[index];
375|375|                return Card(
376|376|                  child: ListTile(
377|377|                    leading: const Icon(Icons.apps, color: Colors.blue),
378|378|                    title: Text(item.processName),
379|379|                    subtitle: Column(
380|380|                      crossAxisAlignment: CrossAxisAlignment.start,
381|381|                      children: [
382|382|                        if (item.description != null) Text(item.description!),
383|383|                        Text(
384|384|                          item.exePath,
385|385|                          style: const TextStyle(fontSize: 11, color: Colors.grey),
386|386|                          maxLines: 1,
387|387|                          overflow: TextOverflow.ellipsis,
388|388|                        ),
389|389|                      ],
390|390|                    ),
391|391|                    isThreeLine: item.description != null,
392|392|                    trailing: Row(
393|393|                      mainAxisSize: MainAxisSize.min,
394|394|                      children: [
395|395|                        Switch(
396|396|                          value: item.enabled,
397|397|                          onChanged: (value) {
398|398|                            ref.read(processWhitelistsProvider.notifier)
399|399|                                .updateProcessWhitelist(item.copyWith(enabled: value));
400|400|                          },
401|401|                        ),
402|402|                        IconButton(
403|403|                          icon: const Icon(Icons.delete),
404|404|                          onPressed: () => _handleDelete(item.id),
405|405|                        ),
406|406|                      ],
407|407|                    ),
408|408|                  ),
409|409|                );
410|410|              },
411|411|            ),
412|412|      floatingActionButton: FloatingActionButton(
413|413|        onPressed: _handleAddProcess,
414|414|        child: const Icon(Icons.add),
415|415|      ),
416|416|    );
417|417|  }
418|418|}
419|419|