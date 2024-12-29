// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$AnnouncementLoadedStateCWProxy {
  AnnouncementLoadedState announcements(List<AnnouncementModel> announcements);

  AnnouncementLoadedState userName(String userName);

  AnnouncementLoadedState profileImage(String profileImage);

  AnnouncementLoadedState filterCommitteeName(String? filterCommitteeName);

  AnnouncementLoadedState searchTextTitle(String? searchTextTitle);

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnnouncementLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnnouncementLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  AnnouncementLoadedState call({
    List<AnnouncementModel>? announcements,
    String? userName,
    String? profileImage,
    String? filterCommitteeName,
    String? searchTextTitle,
  });
}

/// Proxy class for `copyWith` functionality. This is a callable class and can be used as follows: `instanceOfAnnouncementLoadedState.copyWith(...)`. Additionally contains functions for specific fields e.g. `instanceOfAnnouncementLoadedState.copyWith.fieldName(...)`
class _$AnnouncementLoadedStateCWProxyImpl
    implements _$AnnouncementLoadedStateCWProxy {
  const _$AnnouncementLoadedStateCWProxyImpl(this._value);

  final AnnouncementLoadedState _value;

  @override
  AnnouncementLoadedState announcements(
          List<AnnouncementModel> announcements) =>
      this(announcements: announcements);

  @override
  AnnouncementLoadedState userName(String userName) => this(userName: userName);

  @override
  AnnouncementLoadedState profileImage(String profileImage) =>
      this(profileImage: profileImage);

  @override
  AnnouncementLoadedState filterCommitteeName(String? filterCommitteeName) =>
      this(filterCommitteeName: filterCommitteeName);

  @override
  AnnouncementLoadedState searchTextTitle(String? searchTextTitle) =>
      this(searchTextTitle: searchTextTitle);

  @override

  /// This function **does support** nullification of nullable fields. All `null` values passed to `non-nullable` fields will be ignored. You can also use `AnnouncementLoadedState(...).copyWith.fieldName(...)` to override fields one at a time with nullification support.
  ///
  /// Usage
  /// ```dart
  /// AnnouncementLoadedState(...).copyWith(id: 12, name: "My name")
  /// ````
  AnnouncementLoadedState call({
    Object? announcements = const $CopyWithPlaceholder(),
    Object? userName = const $CopyWithPlaceholder(),
    Object? profileImage = const $CopyWithPlaceholder(),
    Object? filterCommitteeName = const $CopyWithPlaceholder(),
    Object? searchTextTitle = const $CopyWithPlaceholder(),
  }) {
    return AnnouncementLoadedState(
      announcements:
          announcements == const $CopyWithPlaceholder() || announcements == null
              ? _value.announcements
              // ignore: cast_nullable_to_non_nullable
              : announcements as List<AnnouncementModel>,
      userName: userName == const $CopyWithPlaceholder() || userName == null
          ? _value.userName
          // ignore: cast_nullable_to_non_nullable
          : userName as String,
      profileImage:
          profileImage == const $CopyWithPlaceholder() || profileImage == null
              ? _value.profileImage
              // ignore: cast_nullable_to_non_nullable
              : profileImage as String,
      filterCommitteeName: filterCommitteeName == const $CopyWithPlaceholder()
          ? _value.filterCommitteeName
          // ignore: cast_nullable_to_non_nullable
          : filterCommitteeName as String?,
      searchTextTitle: searchTextTitle == const $CopyWithPlaceholder()
          ? _value.searchTextTitle
          // ignore: cast_nullable_to_non_nullable
          : searchTextTitle as String?,
    );
  }
}

extension $AnnouncementLoadedStateCopyWith on AnnouncementLoadedState {
  /// Returns a callable class that can be used as follows: `instanceOfAnnouncementLoadedState.copyWith(...)` or like so:`instanceOfAnnouncementLoadedState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$AnnouncementLoadedStateCWProxy get copyWith =>
      _$AnnouncementLoadedStateCWProxyImpl(this);
}
