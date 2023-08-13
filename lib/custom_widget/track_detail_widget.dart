import 'package:flutter/material.dart';
import 'package:music_app/assests/app_style.dart';

class TrackDetailWidget extends StatelessWidget {
  String title;
  String value;

  TrackDetailWidget(this.title, this.value, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: AppStyle().titleTextStyle),
          Text(value,
              style: AppStyle().subTitleTextStyle.merge(const TextStyle(
                    color: Colors.black,
                  ))),
        ],
      ),
    );
  }
}
