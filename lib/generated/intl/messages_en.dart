// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "album_name": MessageLookupByLibrary.simpleMessage("Album Name"),
        "artist": MessageLookupByLibrary.simpleMessage("Artist"),
        "bookmarks": MessageLookupByLibrary.simpleMessage("BookMarks"),
        "explicit": MessageLookupByLibrary.simpleMessage("Explicit"),
        "false_": MessageLookupByLibrary.simpleMessage("false"),
        "lyrics": MessageLookupByLibrary.simpleMessage("Lyrics"),
        "name": MessageLookupByLibrary.simpleMessage("Name"),
        "no_bookmark_available":
            MessageLookupByLibrary.simpleMessage("No bookmark available."),
        "no_data_available":
            MessageLookupByLibrary.simpleMessage("No data available."),
        "no_internet_connection_msg":
            MessageLookupByLibrary.simpleMessage("No internet connection."),
        "rating": MessageLookupByLibrary.simpleMessage("Rating"),
        "track_details": MessageLookupByLibrary.simpleMessage("Track Details"),
        "track_list": MessageLookupByLibrary.simpleMessage("TrackList"),
        "true_": MessageLookupByLibrary.simpleMessage("true")
      };
}
