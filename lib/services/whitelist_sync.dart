import 'package:fl_clash/common/common.dart';
import 'package:fl_clash/database/database.dart';
import 'package:fl_clash/models/clash_config.dart';
import 'package:fl_clash/models/whitelist.dart';
import 'package:fl_clash/models/process_whitelist.dart';
import 'package:fl_clash/enum/enum.dart';
import 'package:fl_clash/providers/providers.dart';
import 'package:fl_clash/state.dart';
import 'dart:io';

class WhitelistRuleSync {
  static Future<void> _log(String msg) async {
    try {
      final file = File('${Platform.environment['TEMP'] ?? 'C:\\Windows\\Temp'}\\flclash_whitelist.log');
      await file.writeAsString('${DateTime.now()}: $msg\n', mode: FileMode.append);
    } catch (_) {}
  }

  /// 触发 Clash 配置重载
  static void _triggerReload() {
    try {
      final ref = globalState.container;
      _log('Triggering config reload...');
      // 用 applyProfileDebounce 强制重新应用配置（包括规则）
      ref.read(setupActionProvider.notifier).applyProfileDebounce();
      _log('Config reload triggered OK');
    } catch (e) {
      _log('Failed to trigger config reload: $e');
    }
  }

  /// 同步域名白名单到 Clash 规则
  static Future<void> syncDomainWhitelist() async {
    _log('=== syncDomainWhitelist start ===');
    final whitelists = await database.whitelistsDao.queryEnabled().get();
    _log('Enabled domain whitelists: ${whitelists.length}');

    final existingRules = await database.rulesDao.queryGlobalAddedRules().get();
    _log('Existing global rules: ${existingRules.length}');

    // 找出旧的域名白名单规则
    final whitelistRuleIds = existingRules
        .where((rule) =>
            rule.ruleAction == RuleAction.DOMAIN_SUFFIX &&
            rule.ruleTarget == RuleTarget.DIRECT.name &&
            rule.content != null &&
            whitelists.any((w) => w.domain == rule.content))
        .map((rule) => rule.id)
        .toList();
    _log('Old domain whitelist rules to remove: ${whitelistRuleIds.length}');

    if (whitelistRuleIds.isNotEmpty) {
      await database.rulesDao.delRules(whitelistRuleIds);
    }

    int added = 0;
    for (final whitelist in whitelists) {
      final alreadyExists = existingRules.any((rule) =>
          rule.ruleAction == RuleAction.DOMAIN_SUFFIX &&
          rule.content == whitelist.domain &&
          rule.ruleTarget == RuleTarget.DIRECT.name &&
          !whitelistRuleIds.contains(rule.id));

      if (!alreadyExists) {
        final rule = Rule(
          ruleAction: RuleAction.DOMAIN_SUFFIX,
          content: whitelist.domain,
          ruleTarget: RuleTarget.DIRECT.name,
        );
        await database.rulesDao.putGlobalRule(rule);
        added++;
        _log('Added domain rule: ${whitelist.domain} -> DIRECT');
      }
    }
    _log('Domain sync done. Added: $added');
    _triggerReload();
  }

  /// 同步进程白名单到 Clash 规则
  static Future<void> syncProcessWhitelist() async {
    _log('=== syncProcessWhitelist start ===');
    final processWhitelists =
        await database.processWhitelistsDao.queryEnabled().get();
    _log('Enabled process whitelists: ${processWhitelists.length}');

    final existingRules = await database.rulesDao.queryGlobalAddedRules().get();

    final processRuleIds = existingRules
        .where((rule) =>
            rule.ruleAction == RuleAction.PROCESS_NAME &&
            rule.ruleTarget == RuleTarget.DIRECT.name)
        .map((rule) => rule.id)
        .toList();
    _log('Old process rules to remove: ${processRuleIds.length}');

    if (processRuleIds.isNotEmpty) {
      await database.rulesDao.delRules(processRuleIds);
    }

    for (final pw in processWhitelists) {
      final rule = Rule(
        ruleAction: RuleAction.PROCESS_NAME,
        content: pw.processName,
        ruleTarget: RuleTarget.DIRECT.name,
      );
      await database.rulesDao.putGlobalRule(rule);
      _log('Added process rule: ${pw.processName} -> DIRECT');
    }
    _log('Process sync done');
    _triggerReload();
  }

  /// 同步所有白名单
  static Future<void> syncAll() async {
    await syncDomainWhitelist();
    await syncProcessWhitelist();
  }
}
