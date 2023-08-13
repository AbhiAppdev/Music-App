import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/ui/bookmark/bookmarks.dart';
import 'package:music_app/ui/bookmark/cubit/bookmarks_cubit.dart';
import 'package:music_app/ui/track_details/track_details.dart';
import 'package:music_app/utils/screen.dart';

import '../ui/track_details/cubit/track_details_cubit.dart';

class Routes {
  static Route? generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case Screen.track_detail:
        Map<String, dynamic> argument =
            settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) =>
                  TrackDetailsCubit(trackId: argument['track_id']),
              child: TrackDetailsWidget(argument['track_id']),
            );
          },
        );
      case Screen.bookmark:
        return MaterialPageRoute(
          builder: (context) {
            return BlocProvider(
              create: (context) => BookmarksCubit(),
              child: const BookMarksWidget(),
            );
          },
        );
    }
  }
}
