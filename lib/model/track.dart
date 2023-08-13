class TrackList {
  List<Track> trackList = <Track>[];

  TrackList(this.trackList);

  TrackList.fromJson(Map<String, dynamic> json) {
    if (json['track'] != null) {
      trackList = <Track>[];
      json['track'].forEach((v) {
        trackList.add(Track.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (trackList.isNotEmpty) {
      data['track'] = trackList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Track {
  int trackId = 0;
  String trackName = "";
  int trackRating = 0;
  int commontrackId = 0;
  int instrumental = 0;
  int explicit = 0;
  bool hasLyrics = false;
  int hasSubtitles = 0;
  int hasRichsync = 0;
  int numFavourite = 0;
  int albumId = 0;
  String albumName = '';
  int artistId = 0;
  String artistName = '';
  String trackShareUrl = '';
  String trackEditUrl = '';
  int restricted = 0;
  String updatedTime = '';

  Track();

  Track.fromJson(Map<String, dynamic> json) {
    trackId = json['track_id'];
    trackName = json['track_name'];
    trackRating = json['track_rating'];
    commontrackId = json['commontrack_id'];
    instrumental = json['instrumental'];
    explicit = json['explicit'];
    hasLyrics = json['has_lyrics'] == 0 ? false : true;
    hasSubtitles = json['has_subtitles'];
    hasRichsync = json['has_richsync'];
    numFavourite = json['num_favourite'];
    albumId = json['album_id'];
    albumName = json['album_name'];
    artistId = json['artist_id'];
    artistName = json['artist_name'];
    trackShareUrl = json['track_share_url'];
    trackEditUrl = json['track_edit_url'];
    restricted = json['restricted'];
    updatedTime = json['updated_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['track_id'] = trackId;
    data['track_name'] = trackName;
    data['track_rating'] = trackRating;
    data['commontrack_id'] = commontrackId;
    data['instrumental'] = instrumental;
    data['explicit'] = explicit;
    data['has_lyrics'] = hasLyrics;
    data['has_subtitles'] = hasSubtitles;
    data['has_richsync'] = hasRichsync;
    data['num_favourite'] = numFavourite;
    data['album_id'] = albumId;
    data['album_name'] = albumName;
    data['artist_id'] = artistId;
    data['artist_name'] = artistName;
    data['track_share_url'] = trackShareUrl;
    data['track_edit_url'] = trackEditUrl;
    data['restricted'] = restricted;
    data['updated_time'] = updatedTime;
    return data;
  }
}
