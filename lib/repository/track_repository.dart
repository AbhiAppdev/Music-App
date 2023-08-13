import 'dart:convert';

import 'package:http/http.dart';
import 'package:music_app/model/lyrics.dart';
import 'package:music_app/model/track.dart';
import 'package:music_app/utils/api_urls.dart';
import 'package:music_app/utils/constant.dart';

class TrackRepository {
  /// fetch track list
  Future<List<Track>> getTrack() async {
    String url = "${ApiUrls.get_track}?apikey=$musix_api_key";

    Response response = await Client().get(Uri.parse(url));

    List<Track> trackList = [];
    if (jsonDecode(response.body)['message']['header']['status_code'] == 200) {
      List<dynamic> list = jsonDecode(response.body)['message']["body"]
          ["track_list"] as List<dynamic>;
      for (var element in list) {
        trackList.add(Track.fromJson(element['track']));
      }
    }
    return trackList;
  }

  /// fetch track details
  Future<Track> getTrackDetails(String trackId) async {
    String url = "${ApiUrls.track_details}?track_id=$trackId&apikey=$musix_api_key";

    Response response = await Client().get(Uri.parse(url));

    Track track = Track();
    if (jsonDecode(response.body)['message']['header']['status_code'] == 200) {
      track =
          Track.fromJson(jsonDecode(response.body)['message']["body"]["track"]);
    }
    return track;
  }

  /// fetch track lyrics
  Future<Lyrics> getTrackLyrics(String trackId) async {
    String url = "${ApiUrls.track_lyrics}?track_id=$trackId&apikey=$musix_api_key";

    Response response = await Client().get(Uri.parse(url));

    Lyrics lyrics = Lyrics();
    if (jsonDecode(response.body)['message']['header']['status_code'] == 200) {
      lyrics = Lyrics.fromJson(
          jsonDecode(response.body)['message']["body"]["lyrics"]);
    }
    return lyrics;
  }
}
