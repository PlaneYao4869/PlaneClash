// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../process_whitelist.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(processWhitelistsStream)
final processWhitelistsStreamProvider = ProcessWhitelistsStreamProvider._();

final class ProcessWhitelistsStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ProcessWhitelist>>,
          List<ProcessWhitelist>,
          Stream<List<ProcessWhitelist>>
        >
    with
        $FutureModifier<List<ProcessWhitelist>>,
        $StreamProvider<List<ProcessWhitelist>> {
  ProcessWhitelistsStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'processWhitelistsStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$processWhitelistsStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<ProcessWhitelist>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<ProcessWhitelist>> create(Ref ref) {
    return processWhitelistsStream(ref);
  }
}

String _$processWhitelistsStreamHash() =>
    r'c7539476a574aac0e5f5200963f2cabf7acd6c79';

@ProviderFor(ProcessWhitelists)
final processWhitelistsProvider = ProcessWhitelistsProvider._();

final class ProcessWhitelistsProvider
    extends $NotifierProvider<ProcessWhitelists, List<ProcessWhitelist>> {
  ProcessWhitelistsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'processWhitelistsProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$processWhitelistsHash();

  @$internal
  @override
  ProcessWhitelists create() => ProcessWhitelists();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ProcessWhitelist> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ProcessWhitelist>>(value),
    );
  }
}

String _$processWhitelistsHash() => r'32f8471655ea1ed0b86eabd1a79072514375724b';

abstract class _$ProcessWhitelists extends $Notifier<List<ProcessWhitelist>> {
  List<ProcessWhitelist> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<List<ProcessWhitelist>, List<ProcessWhitelist>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<ProcessWhitelist>, List<ProcessWhitelist>>,
              List<ProcessWhitelist>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
