
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/internet_bloc/internet_bloc.dart';
import 'package:music_app/model/lyrics.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../custom_widget/track_detail_widget.dart';
import '../../generated/l10n.dart';
import '../../model/track.dart';
import 'cubit/track_details_cubit.dart';
import 'cubit/track_details_state.dart';

class TrackDetailsWidget extends StatefulWidget {
  String trackId;

  TrackDetailsWidget(this.trackId, {super.key});

  @override
  State<TrackDetailsWidget> createState() => _TrackDetailsWidgetState();
}

class _TrackDetailsWidgetState extends State<TrackDetailsWidget> {
  late SharedPreferences sharedPreferences;
  bool isBookMark = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(S.of(context).track_details),
          centerTitle: true,
          backgroundColor: Theme.of(context).primaryColorLight),
      body: BlocBuilder<InternetBloc, InternetState>(
        builder: (context, state) {
          if (state is InternetGainState) {
            return BlocBuilder<TrackDetailsCubit, TrackDetailsState>(
              builder: (context, state) {
                if (state is TrackDetailsLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                }
                if (state is TrackDetailsSuccessState) {
                  return trackDetailWidget(
                      state.track, state.lyrics, state.isBookMarked);
                }
                return Center(child: Text(S.of(context).no_data_available));
              },
            );
          }
          if (state is InternetLostState) {
            return Center(
                child: Text(S.of(context).no_internet_connection_msg));
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.blue,
            ),
          );
        },
      ),
    );
  }

  Widget trackDetailWidget(
    Track track,
    Lyrics lyrics,
    bool isBookMarked,
  ) {
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (track.trackName.isNotEmpty)
                  Expanded(
                    child:
                        TrackDetailWidget(S.of(context).name, track.trackName),
                  ),
                GestureDetector(
                  onTap: () {
                    BlocProvider.of<TrackDetailsCubit>(context)
                        .saveBookMark(track);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Icon(
                      isBookMarked ? Icons.bookmark : Icons.bookmark_border,
                      color: isBookMarked ? Colors.blue : Colors.black54,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            if (track.artistName.isNotEmpty)
              TrackDetailWidget(S.of(context).artist, track.artistName),
            if (track.albumName.isNotEmpty)
              TrackDetailWidget(S.of(context).album_name, track.albumName),
            TrackDetailWidget(
                S.of(context).explicit,
                track.explicit == 0
                    ? S.of(context).false_
                    : S.of(context).true_),
            TrackDetailWidget(
                S.of(context).rating, track.trackRating.toString()),
            if (lyrics.lyricsBody.isNotEmpty)
              TrackDetailWidget(S.of(context).lyrics, lyrics.lyricsBody),
          ],
        ),
      ),
    );
  }
}
