import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';

class DateTimeFormatter {
  static String formatDate(Timestamp? timestamp, {String prefix = ''}) {
    if (timestamp == null) return 'Unknown date';
    final date = timestamp.toDate();
    final formatter = DateFormat('dd-MMM-yyyy');
    return '$prefix${formatter.format(date)}';
  }

  static String formatDateTime(Timestamp? timestamp, {String prefix = ''}) {
    if (timestamp == null) return 'Unknown date';
    final date = timestamp.toDate();
    final formatter = DateFormat('dd-MMM-yyyy hh:mm a');
    return '$prefix${formatter.format(date)}';
  }

  static String formatDateOnly(Timestamp? timestamp) {
    if (timestamp == null) return 'Unknown date';
    final date = timestamp.toDate();
    return DateFormat('dd-MMM-yyyy').format(date);
  }

  static String formatTimeOnly(Timestamp? timestamp) {
    if (timestamp == null) return 'Unknown time';
    final date = timestamp.toDate();
    return DateFormat('hh:mm a').format(date);
  }
}
