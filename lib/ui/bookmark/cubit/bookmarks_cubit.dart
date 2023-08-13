import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../generated/l10n.dart';
import '../../../utils/Preference.dart';

part 'bookmarks_state.dart';

class BookmarksCubit extends Cubit<BookmarksState> {
  BookmarksCubit() : super(BookmarksLoadingState()) {
    getBookMarkList();
  }

  getBookMarkList() async {
    List<Map<String, dynamic>> bookmarkList = [];
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? bookMark =
        sharedPreferences.getString(Preference.prefBookMarkTrack);
    if (bookMark != null && bookMark.isNotEmpty) {
      List<dynamic> bookmarksList = jsonDecode(bookMark) as List<dynamic>;
      if (bookmarksList.isNotEmpty) {
        for (var element in bookmarksList) {
          bookmarkList.add(element as Map<String, dynamic>);
        }
        emit(BookmarksSuccessState(bookmarkList));
      } else {
        emit(BookmarksFailureState(S.current.no_bookmark_available));
      }
    } else {
      emit(BookmarksFailureState(S.current.no_bookmark_available));
    }
  }
}
