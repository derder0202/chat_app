// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$chatControllerHash() => r'1a8aa91aec7df13b5a836a28f939fbfc283fa188';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ChatController
    extends BuildlessAutoDisposeAsyncNotifier<Stream<dynamic>?> {
  late final String userId;
  late final String otherUserId;

  FutureOr<Stream<dynamic>?> build(
    String userId,
    String otherUserId,
  );
}

/// See also [ChatController].
@ProviderFor(ChatController)
const chatControllerProvider = ChatControllerFamily();

/// See also [ChatController].
class ChatControllerFamily extends Family<AsyncValue<Stream<dynamic>?>> {
  /// See also [ChatController].
  const ChatControllerFamily();

  /// See also [ChatController].
  ChatControllerProvider call(
    String userId,
    String otherUserId,
  ) {
    return ChatControllerProvider(
      userId,
      otherUserId,
    );
  }

  @override
  ChatControllerProvider getProviderOverride(
    covariant ChatControllerProvider provider,
  ) {
    return call(
      provider.userId,
      provider.otherUserId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'chatControllerProvider';
}

/// See also [ChatController].
class ChatControllerProvider extends AutoDisposeAsyncNotifierProviderImpl<
    ChatController, Stream<dynamic>?> {
  /// See also [ChatController].
  ChatControllerProvider(
    this.userId,
    this.otherUserId,
  ) : super.internal(
          () => ChatController()
            ..userId = userId
            ..otherUserId = otherUserId,
          from: chatControllerProvider,
          name: r'chatControllerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$chatControllerHash,
          dependencies: ChatControllerFamily._dependencies,
          allTransitiveDependencies:
              ChatControllerFamily._allTransitiveDependencies,
        );

  final String userId;
  final String otherUserId;

  @override
  bool operator ==(Object other) {
    return other is ChatControllerProvider &&
        other.userId == userId &&
        other.otherUserId == otherUserId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, otherUserId.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<Stream<dynamic>?> runNotifierBuild(
    covariant ChatController notifier,
  ) {
    return notifier.build(
      userId,
      otherUserId,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
