import '../../../model/lyrics.dart';
import '../../../model/track.dart';

abstract class TrackDetailsState {}

class TrackDetailsLoadingState extends TrackDetailsState {}

class TrackDetailsSuccessState extends TrackDetailsState {
  Track track = Track();
  Lyrics lyrics = Lyrics();
  bool isBookMarked = false;
  TrackDetailsSuccessState(this.track, this.lyrics,this.isBookMarked);
}

class TrackDetailsFailureState extends TrackDetailsState {}

class SaveBookmarkState extends TrackDetailsState {}

class CheckBookmarkState extends TrackDetailsState {
  bool isBookMarked = false;

  CheckBookmarkState(this.isBookMarked);
}
