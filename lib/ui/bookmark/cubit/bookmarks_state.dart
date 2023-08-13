part of 'bookmarks_cubit.dart';

abstract class BookmarksState {}

class BookmarksInitial extends BookmarksState {}

class BookmarksLoadingState extends BookmarksState {}

class BookmarksSuccessState extends BookmarksState {
  List<Map<String, dynamic>> bookmarkList = [];

  BookmarksSuccessState(this.bookmarkList);
}

class BookmarksFailureState extends BookmarksState {
  String message = '';

  BookmarksFailureState(this.message);
}
