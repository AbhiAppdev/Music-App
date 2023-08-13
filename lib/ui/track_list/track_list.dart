import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/custom_widget/track_item_widget.dart';
import 'package:music_app/internet_bloc/internet_bloc.dart';
import 'package:music_app/model/track.dart';
import 'package:music_app/utils/screen.dart';

import '../../generated/l10n.dart';
import 'cubit/track_list_cubit.dart';

class TrackListWidget extends StatefulWidget {
  const TrackListWidget({super.key});

  @override
  State<TrackListWidget> createState() => _TrackListWidgetState();
}

class _TrackListWidgetState extends State<TrackListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(S.of(context).track_list),
          centerTitle: true,
          actions: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Screen.bookmark);
              },
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Icon(
                  Icons.bookmark,
                  size: 20,
                ),
              ),
            )
          ],
          backgroundColor: Theme.of(context).primaryColorLight),
      body: Center(
        child: BlocBuilder<InternetBloc, InternetState>(
          builder: (context, state) {
            if (state is InternetGainState) {
              return BlocBuilder<TrackListCubit, TrackListState>(
                builder: (context, state) {
                  if (state is TrackListLoadingState) {
                    return const CircularProgressIndicator(
                      color: Colors.blue,
                    );
                  }

                  if (state is TrackListSuccessState) {
                    return trackListWidget(state.trackList);
                  }

                  return Text(S.of(context).no_data_available);
                },
              );
            }
            if (state is InternetLostState) {
              return Text(S.of(context).no_internet_connection_msg);
            }

            return const CircularProgressIndicator(
              color: Colors.blue,
            );
          },
        ),
      ),
    );
  }

  Widget trackListWidget(List<Track> trackList) {
    return ListView.separated(
      itemCount: trackList.length,
      itemBuilder: (context, index) {
        return TrackItemWidget(
          trackList[index],
          () {
            Navigator.pushNamed(context, Screen.track_detail,
                arguments: {'track_id': trackList[index].trackId.toString()});
          },
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 1,
          color: Colors.grey,
        );
      },
    );
  }
}
