import 'dart:io';

class WindowsFirewallService {
  static const String _rulePrefix = 'PlaneClash_';

  /// 添加防火墙出站规则（直连）
  static Future<bool> addBypassRule({
    required String processName,
    required String exePath,
  }) async {
    final ruleName = '$_rulePrefix$processName';
    
    // 先删除旧规则
    await removeRule(processName);
    
    // 添加新的出站规则，允许直连
    final result = await Process.run('netsh', [
      'advfirewall',
      'firewall',
      'add',
      'rule',
      'name=$ruleName',
      'dir=out',
      'action=allow',
      'program=$exePath',
      'enable=yes',
    ]);
    
    return result.exitCode == 0;
  }

  /// 删除防火墙规则
  static Future<bool> removeRule(String processName) async {
    final ruleName = '$_rulePrefix$processName';
    
    final result = await Process.run('netsh', [
      'advfirewall',
      'firewall',
      'delete',
      'rule',
      'name=$ruleName',
    ]);
    
    return result.exitCode == 0;
  }

  /// 检查规则是否存在
  static Future<bool> ruleExists(String processName) async {
    final ruleName = '$_rulePrefix$processName';
    
    final result = await Process.run('netsh', [
      'advfirewall',
      'firewall',
      'show',
      'rule',
      'name=$ruleName',
    ]);
    
    return result.stdout.toString().contains(ruleName);
  }

  /// 获取所有 PlaneClash 规则
  static Future<List<String>> getAllRules() async {
    final result = await Process.run('netsh', [
      'advfirewall',
      'firewall',
      'show',
      'rule',
      'name=$_rulePrefix',
    ]);
    
    final output = result.stdout.toString();
    final rules = <String>[];
    
    final nameRegex = RegExp(r'Rule Name:\s+$_rulePrefix(.+)');
    for (final match in nameRegex.allMatches(output)) {
      rules.add(match.group(1)!);
    }
    
    return rules;
  }

  /// 清除所有 PlaneClash 规则
  static Future<void> clearAllRules() async {
    final rules = await getAllRules();
    for (final rule in rules) {
      await removeRule(rule);
    }
  }
}
