part of 'track_list_cubit.dart';

abstract class TrackListState {}

class TrackListLoadingState extends TrackListState {}

class TrackListSuccessState extends TrackListState {
  List<Track> trackList = [];
  TrackListSuccessState(this.trackList);
}

class TrackListFailureState extends TrackListState {}

