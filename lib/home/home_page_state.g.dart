// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$HomePageLoadedStateCWProxy {
  HomePageLoadedState pageNumber(int pageNumber);

  HomePageLoadedState member(User member);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomePageLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomePageLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomePageLoadedState call({
    int? pageNumber,
    User? member,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfHomePageLoadedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfHomePageLoadedState.copyWith.fieldName(...)`
class _$HomePageLoadedStateCWProxyImpl implements _$HomePageLoadedStateCWProxy {
  const _$HomePageLoadedStateCWProxyImpl(this._value);

  final HomePageLoadedState _value;

  @override
  HomePageLoadedState pageNumber(int pageNumber) =>
      this(pageNumber: pageNumber);

  @override
  HomePageLoadedState member(User member) => this(member: member);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `HomePageLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// HomePageLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  HomePageLoadedState call({
    Object? pageNumber = const $CopyWithPlaceholder(),
    Object? member = const $CopyWithPlaceholder(),
  }) {
    return HomePageLoadedState(
      pageNumber:
          pageNumber == const $CopyWithPlaceholder() || pageNumber == null
              ? _value.pageNumber
              // ignore: cast_nullable_to_non_nullable
              : pageNumber as int,
      member: member == const $CopyWithPlaceholder() || member == null
          ? _value.member
          // ignore: cast_nullable_to_non_nullable
          : member as User,
    );
  }
}

extension $HomePageLoadedStateCopyWith on HomePageLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfHomePageLoadedState.copyWith(...)` or like so:`instanceOfHomePageLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$HomePageLoadedStateCWProxy get copyWith =>
      _$HomePageLoadedStateCWProxyImpl(this);
}
