// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HomeLoadedStateCWProxy {
  HomeLoadedState pageNumber(int pageNumber);

  HomeLoadedState user(User user);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeLoadedState call({
    int? pageNumber,
    User? user,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHomeLoadedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHomeLoadedState.copyWith.fieldName(...)`
class _$HomeLoadedStateCWProxyImpl implements _$HomeLoadedStateCWProxy {
  const _$HomeLoadedStateCWProxyImpl(this._value);

  final HomeLoadedState _value;

  @override
  HomeLoadedState pageNumber(int pageNumber) => this(pageNumber: pageNumber);

  @override
  HomeLoadedState user(User user) => this(user: user);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomeLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomeLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomeLoadedState call({
    Object? pageNumber = const $CopyWithPlaceholder(),
    Object? user = const $CopyWithPlaceholder(),
  }) {
    return HomeLoadedState(
      pageNumber:
          pageNumber == const $CopyWithPlaceholder() || pageNumber == null
              ? _value.pageNumber
              // ignore: cast_nullable_to_non_nullable
              : pageNumber as int,
      user: user == const $CopyWithPlaceholder() || user == null
          ? _value.user
          // ignore: cast_nullable_to_non_nullable
          : user as User,
    );
  }
}

extension $HomeLoadedStateCopyWith on HomeLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfHomeLoadedState.copyWith(...)` or like so:`instanceOfHomeLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HomeLoadedStateCWProxy get copyWith => _$HomeLoadedStateCWProxyImpl(this);
}
