import 'package:intl/intl.dart';

class DateTimeUtils {
  static String? formatDate(String formatDate, String date) {
    final DateTime? dt = DateTime.tryParse(date);
    if (dt == null) return null;
    final DateTime dtUtc = dt.toUtc().toLocal();
    return DateFormat(formatDate).format(dtUtc);
  }
}
