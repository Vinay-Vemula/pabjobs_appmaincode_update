import 'package:intl/intl.dart';

class TimeAgo {
  static String? timeAgoSinceDate(int time) {
    DateTime dateOfPosting = DateTime.fromMillisecondsSinceEpoch(time);
    final dateNow = DateTime.now();
    final diff = dateNow.difference(dateOfPosting);
    if (diff.inDays > 8) {
      // print((diff.inDays / 7).floor());
      return DateFormat('dd MMM yy').format(dateOfPosting);
    } else if ((diff.inDays / 7).floor() >= 1) {
      return 'Last week';
    } else if (diff.inDays >= 2) {
      return '${diff.inDays} days ago';
    } else if (diff.inDays == 1) {
      return '1 day ago';
    } else if (diff.inHours >= 2) {
      return '${diff.inHours} hours ago';
    } else if (diff.inHours == 1) {
      return '1 hour ago';
    } else if (diff.inMinutes >= 2) {
      return '${diff.inMinutes} minutes ago';
    } else if (diff.inMinutes == 1) {
      return '1 minute ago';
    } else if (diff.inSeconds >= 2) {
      return '${diff.inSeconds} seconds ago';
    } else {
      return 'Just now';
    }
  }
}
