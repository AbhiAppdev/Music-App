import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:music_app/model/track.dart';
import 'package:music_app/repository/track_repository.dart';

part 'track_list_state.dart';

class TrackListCubit extends Cubit<TrackListState> {

  TrackListCubit() : super(TrackListLoadingState()) {
    fetchTrackList();
  }

  TrackRepository trackRepository = TrackRepository();

  fetchTrackList() async {
  await trackRepository.getTrack().then((value) {
    emit(TrackListSuccessState(value.where((element) => element.hasLyrics).toList()));
    }, onError: (e) {
      emit(TrackListFailureState());
    });
  }

  @override
  Future<void> close() {
    return super.close();
  }
}
