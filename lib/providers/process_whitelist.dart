import 'dart:async';

import 'package:fl_clash/database/database.dart';
import 'package:fl_clash/models/process_whitelist.dart';
import 'package:fl_clash/services/windows_firewall.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'generated/process_whitelist.g.dart';

@riverpod
Stream<List<ProcessWhitelist>> processWhitelistsStream(Ref ref) {
  return database.processWhitelistsDao.queryAll().watch();
}

@Riverpod(keepAlive: true)
class ProcessWhitelists extends _$ProcessWhitelists {
  @override
  List<ProcessWhitelist> build() {
    return ref.watch(processWhitelistsStreamProvider).value ?? [];
  }

  Future<void> _syncFirewall() async {
    try {
      // 清除所有旧规则
      await WindowsFirewallService.clearAllRules();
      
      // 添加所有启用的规则
      final enabledList = state.where((item) => item.enabled);
      for (final item in enabledList) {
        await WindowsFirewallService.addBypassRule(
          processName: item.processName,
          exePath: item.exePath,
        );
      }
    } catch (e) {
      print('Failed to sync firewall rules: $e');
    }
  }

  Future<void> addProcessWhitelist(ProcessWhitelist whitelist) async {
    final previous = List<ProcessWhitelist>.from(state);
    state = [...previous, whitelist];
    
    try {
      await database.processWhitelistsDao.insertProcessWhitelist(whitelist);
      await _syncFirewall();
    } catch (e) {
      state = previous;
      rethrow;
    }
  }

  Future<void> updateProcessWhitelist(ProcessWhitelist whitelist) async {
    final previous = List<ProcessWhitelist>.from(state);
    final index = previous.indexWhere((item) => item.id == whitelist.id);
    if (index == -1) return;
    
    final newList = List<ProcessWhitelist>.from(previous);
    newList[index] = whitelist;
    state = newList;
    
    try {
      await database.processWhitelistsDao.updateProcessWhitelist(whitelist);
      await _syncFirewall();
    } catch (e) {
      state = previous;
      rethrow;
    }
  }

  Future<void> deleteProcessWhitelist(int id) async {
    final previous = List<ProcessWhitelist>.from(state);
    state = previous.where((item) => item.id != id).toList();
    
    try {
      await database.processWhitelistsDao.deleteProcessWhitelist(id);
      await _syncFirewall();
    } catch (e) {
      state = previous;
      rethrow;
    }
  }

  Future<void> deleteAll() async {
    final previous = List<ProcessWhitelist>.from(state);
    state = [];
    
    try {
      await database.processWhitelistsDao.deleteAll();
      await _syncFirewall();
    } catch (e) {
      state = previous;
      rethrow;
    }
  }
}
