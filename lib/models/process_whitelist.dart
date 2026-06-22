import 'package:freezed_annotation/freezed_annotation.dart';

part 'generated/process_whitelist.freezed.dart';
part 'generated/process_whitelist.g.dart';

@freezed
abstract class ProcessWhitelist with _$ProcessWhitelist {
  const factory ProcessWhitelist({
    @Default(-1) int id,
    required String processName,
    required String exePath,
    @Default(true) bool enabled,
    String? description,
    DateTime? createdAt,
  }) = _ProcessWhitelist;

  factory ProcessWhitelist.fromJson(Map<String, Object?> json) =>
      _$ProcessWhitelistFromJson(json);

  factory ProcessWhitelist.create({
    required String processName,
    required String exePath,
    String? description,
  }) {
    return ProcessWhitelist(
      processName: processName,
      exePath: exePath,
      description: description,
      createdAt: DateTime.now(),
    );
  }
}
