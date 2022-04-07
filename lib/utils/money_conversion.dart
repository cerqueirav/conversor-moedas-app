import 'package:moedas_app/utils/Enum/coin.dart';

String selectCoin(String coinOne, String coinTwo) {
  String urlBase = "https://economia.awesomeapi.com.br/json/";

  return urlBase + coinOne + "-" + coinTwo;
}
