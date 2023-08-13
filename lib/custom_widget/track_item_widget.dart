import 'package:flutter/material.dart';
import 'package:music_app/assests/app_style.dart';
import 'package:music_app/model/track.dart';

class TrackItemWidget extends StatelessWidget {
  Track track;
  VoidCallback callBack;

  TrackItemWidget(this.track, this.callBack, {super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: callBack,
      child: Container(
        margin: const EdgeInsets.all(14),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              width: 16,
            ),
            const Icon(Icons.library_music, color: Colors.black38),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(track.trackName.trim(),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle().titleTextStyle),
                  Text(track.albumName.trim(),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: AppStyle().subTitleTextStyle),
                ],
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
                child: Text(
              track.artistName,
              maxLines: 2,
              textAlign: TextAlign.start,
              overflow: TextOverflow.ellipsis,
              style: AppStyle().smallTextTextStyle,
            )),
          ],
        ),
      ),
    );
  }
}
