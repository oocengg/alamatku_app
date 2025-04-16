import 'package:intl/intl.dart';

String formatRupiah(double nilai) {
  final NumberFormat currencyFormat = NumberFormat.currency(
    locale: 'id_ID',
    symbol: 'Rp. ',
    decimalDigits: 2,
  );

  if (nilai >= 1e12) {
    return '${currencyFormat.format(nilai / 1e12)} Triliun';
  } else if (nilai >= 1e9) {
    return '${currencyFormat.format(nilai / 1e9)} Miliar';
  } else if (nilai >= 1e6) {
    return '${currencyFormat.format(nilai / 1e6)} Juta';
  } else if (nilai >= 1e3) {
    return '${currencyFormat.format(nilai / 1e3)} Ribu';
  } else {
    return currencyFormat.format(nilai);
  }
}
