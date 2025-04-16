import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

// Format Date Output : Jan 1, 2022
String formatDateMMMdyyyy(String dateStr) {
  DateTime date = DateTime.parse(dateStr);
  String formattedDate = DateFormat("MMM d, yyyy").format(date);
  return formattedDate;
}

// Format Date into Indonesian Output : Sabtu, 01 Januari 2022
String formatDateEEEEddMMMMyyyy(String dateStr) {
  initializeDateFormatting('id_ID', null);
  DateTime date = DateTime.parse(dateStr);
  String formattedDate = DateFormat("EEEE, dd MMMM yyyy", 'id_ID').format(date);
  return formattedDate;
}

String formatDateEEEEddMMMyyyy(String dateStr) {
  initializeDateFormatting('id_ID', null);
  DateTime date = DateTime.parse(dateStr);
  String formattedDate = DateFormat("EEEE, dd MMM yyyy", 'id_ID').format(date);
  return formattedDate;
}

String formatDateyyyyMMdd(String dateStr) {
  initializeDateFormatting('id_ID', null);
  DateTime date = DateTime.parse(dateStr);
  String formattedDate = DateFormat("yyyy-MM-dd", 'id_ID').format(date);
  return formattedDate;
}

String formatDateddMMyyyy(String dateStr) {
  initializeDateFormatting('id_ID', null);
  DateTime date = DateTime.parse(dateStr);
  String formattedDate = DateFormat("dd MMMM yyyy", 'id_ID').format(date);
  return formattedDate;
}

String formatDateyyyy(String dateStr) {
  initializeDateFormatting('id_ID', null);
  DateTime date = DateTime.parse(dateStr);
  String formattedDate = DateFormat("yyyy", 'id_ID').format(date);
  return formattedDate;
}

// Format Date into Indonesian Output : Sabtu, 01 Januari 2022
String formatDateEEEEddMMyyyydt(DateTime dt) {
  initializeDateFormatting('id_ID', null);
  String formattedDate = DateFormat("EEEE, dd MMMM yyyy", 'id_ID').format(dt);
  return formattedDate;
}

// Format Date into Indonesian Output : 01 Jan 2022
String formatDateddMMMMyyyy(String dateStr) {
  initializeDateFormatting('id_ID', null);
  DateTime date = DateTime.parse(dateStr);
  String formattedDate = DateFormat("dd MMM yyyy", 'id_ID').format(date);
  return formattedDate;
}

// Format Date Output : 01
String formatDatedd(String dateStr) {
  DateTime date = DateFormat("dd-MM-yyyy").parse(dateStr);
  String formattedDate = DateFormat("dd").format(date);
  return formattedDate;
}

// Format Date Output : Jan
String formatDateMMM(String dateStr) {
  DateTime date = DateFormat("dd-MM-yyyy").parse(dateStr);
  String formattedDate = DateFormat("MMM").format(date);
  return formattedDate;
}

// Format Date Output : 01 Jan
String formatDateddMMM(String dateStr) {
  DateTime date = DateFormat("dd-MM-yyyy").parse(dateStr);
  String formattedDate = DateFormat("dd MMM").format(date);
  return formattedDate;
}

String formatDateHHmmss(DateTime dateStr) {
  String formattedDate = DateFormat("HH:mm:ss").format(dateStr);
  return formattedDate;
}

// Format Date Output : 01
String formatDateCustom(DateTime date, String format) {
  initializeDateFormatting('id_ID', null);
  String formattedDate = DateFormat(format, 'id_ID').format(date);
  return formattedDate;
}

// Format Date Output : 01
String formatDateCustomfromString(String dateStr, String format) {
  initializeDateFormatting('id_ID', null);
  DateTime date = DateFormat("dd/MM/yyyy").parse(dateStr);
  String formattedDate = DateFormat(format, 'id_ID').format(date);
  return formattedDate;
}

// Format Date Output : 2024-07-28
String formatDateStrip(DateTime date) {
  initializeDateFormatting('id_ID', null);
  String formattedDate = DateFormat('yyyy-MM-dd', 'id_ID').format(date);
  return formattedDate;
}

// Format Time Output : 10:15
String formatTime(String time) {
  initializeDateFormatting('id_ID', null);
  DateFormat inputFormat = DateFormat("HH:mm:ss", "id_ID");
  DateFormat outputFormat = DateFormat("HH:mm", "id_ID");
  DateTime dateTime = inputFormat.parse(time);
  return outputFormat.format(dateTime);
}

String otherFormatTime(String time) {
  initializeDateFormatting('id_ID', null);

  // Sesuaikan format input dengan format string yang Anda terima
  DateFormat inputFormat = DateFormat("yyyy-MM-dd HH:mm:ss.SSS", "id_ID");
  DateFormat outputFormat = DateFormat("HH:mm", "id_ID");

  DateTime dateTime = inputFormat.parse(time);
  return outputFormat.format(dateTime);
}

String extractTime(String dateTime) {
  return dateTime.split(' ')[1];
}

// Format Date Output : 2 jam lalu (Ouput bergantung pada inputan)
String convertToRelativeTime(String dateString) {
  DateTime now = DateTime.now();
  DateTime date = DateTime.parse(dateString);
  Duration difference = now.difference(date);
  if (difference.inSeconds < 20) {
    return "Baru saja di post";
  } else if (difference.inSeconds < 60) {
    return "${difference.inSeconds} detik lalu";
  } else if (difference.inMinutes < 60) {
    return "${difference.inMinutes} menit lalu";
  } else if (difference.inHours < 24) {
    return "${difference.inHours} jam lalu";
  } else if (difference.inDays < 365) {
    return "${difference.inDays} hari lalu";
  } else {
    int years = difference.inDays ~/ 365;
    return "$years tahun yang lalu";
  }
}
