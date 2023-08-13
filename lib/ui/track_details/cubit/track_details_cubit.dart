import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:music_app/model/lyrics.dart';
import 'package:music_app/model/track.dart';
import 'package:music_app/ui/track_details/cubit/track_details_state.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../repository/track_repository.dart';
import '../../../utils/Preference.dart';

class TrackDetailsCubit extends Cubit<TrackDetailsState> {
  late SharedPreferences sharedPreferences;
  Track track = Track();
  Lyrics lyrics = Lyrics();
  bool isBookMarked = false;

  TrackDetailsCubit({String trackId = ""}) : super(TrackDetailsLoadingState()) {
    initializeSharedPreference();
    fetchTrackDetails(trackId);
  }

  initializeSharedPreference() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  TrackRepository trackRepository = TrackRepository();

  fetchTrackDetails(String trackId) async {
    await Future.wait([
      trackRepository.getTrackDetails(trackId),
      trackRepository.getTrackLyrics(trackId),
    ]).then((value) async {
      track = value[0] as Track;
      lyrics = value[1] as Lyrics;
      sharedPreferences = await SharedPreferences.getInstance();
      String bookMark =
          sharedPreferences.getString(Preference.prefBookMarkTrack) ?? '';
      if (bookMark.isNotEmpty) {
        List<dynamic> bookmarkList = jsonDecode(bookMark);
        isBookMarked = bookmarkList
            .where((element) =>
                element['track_id'].toString() == trackId.toString())
            .toList()
            .isNotEmpty;
      }
      emit(TrackDetailsSuccessState(track, lyrics, isBookMarked));
    }, onError: (e) {
      emit(TrackDetailsFailureState());
    });
  }

  saveBookMark(Track track) {
    List<Map<String, dynamic>> bookmarkList = [];
    Map<String, dynamic> details = {
      "track_id": track.trackId,
      "track_name": track.trackName
    };
    String bookMark =
        sharedPreferences.getString(Preference.prefBookMarkTrack) ?? '';
    if (bookMark.isNotEmpty) {
      List<dynamic> bookmarksList = jsonDecode(bookMark);
      if (bookmarksList.isNotEmpty) {
        for (int i = 0; i < bookmarksList.length; i++) {
          var element = bookmarksList[i];
          if (track.trackId == element['track_id']) {
            isBookMarked = false;
            bookmarksList.removeAt(i);
          } else {
            bookmarksList.add(details);
            isBookMarked = true;
          }
          break;
        }
      } else {
        bookmarksList.add(details);
        isBookMarked = true;
      }

      if (bookmarksList.isNotEmpty) {
        for (var element in bookmarksList) {
          bookmarkList.add(element as Map<String, dynamic>);
        }
      } else {
        bookmarkList = [];
      }
    }

    sharedPreferences.setString(
        Preference.prefBookMarkTrack, jsonEncode(bookmarkList));
    emit(TrackDetailsSuccessState(track, lyrics, isBookMarked));
  }

  getBookMarkList(String trackId) async {
    sharedPreferences = await SharedPreferences.getInstance();
    String bookMark =
        sharedPreferences.getString(Preference.prefBookMarkTrack) ?? '';
    if (bookMark.isNotEmpty) {
      List<dynamic> bookmarkList = jsonDecode(bookMark);
      for (int i = 0; i < bookmarkList.length; i++) {
        var element = bookmarkList[i];
        if (trackId == element['track_id']) {
          emit(CheckBookmarkState(true));
        }
        break;
      }
    }
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
