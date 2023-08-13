import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_app/assests/app_style.dart';
import 'package:music_app/ui/bookmark/cubit/bookmarks_cubit.dart';
import 'package:music_app/utils/screen.dart';
import 'package:visibility_detector/visibility_detector.dart';

import '../../generated/l10n.dart';

class BookMarksWidget extends StatefulWidget {
  const BookMarksWidget({super.key});

  @override
  State<BookMarksWidget> createState() => _BookMarksWidgetState();
}

class _BookMarksWidgetState extends State<BookMarksWidget> {
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      onVisibilityChanged: (info) {
        BlocProvider.of<BookmarksCubit>(context).getBookMarkList();
      },
      key: const Key("bookmarks"),
      child: Scaffold(
        appBar: AppBar(
            title: Text(S.of(context).bookmarks),
            centerTitle: true,
            backgroundColor: Theme.of(context).primaryColorLight),
        body: Center(
          child: BlocBuilder<BookmarksCubit, BookmarksState>(
            builder: (context, state) {
              if (state is BookmarksLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.blue,
                  ),
                );
              }
              if (state is BookmarksSuccessState) {
                return ListView.separated(
                  itemCount: state.bookmarkList.length,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      thickness: 1,
                      color: Colors.grey,
                    );
                  },
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, Screen.track_detail, arguments: {
                          'track_id':
                              state.bookmarkList[index]['track_id'].toString()
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Text(
                                  state.bookmarkList[index]['track_name'],
                                  style: AppStyle().smallTextTextStyle),
                            ),
                            const Icon(
                              Icons.arrow_forward_ios,
                              size: 20,
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
              if (state is BookmarksFailureState) {
                return Text(state.message);
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }
}
