import 'package:bcdx_21312020/app/utils/rupiah_currency.dart';

String totalBayar(String num_1, String num_2) {
  return rupiahCurrency((int.parse(num_1) * int.parse(num_2)).toString());
}