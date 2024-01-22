import 'package:intl/intl.dart';

String rupiahCurrency(String number) {
  number = number.replaceAll(RegExp(r"\D"), "");
  
  NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 0,
  );

  return currencyFormatter.format(int.parse(number));
}