import 'package:moedas_app/utils/Enum/coin.dart';

String selectCoin(Coin coinOne, Coin coinTwo) {
  String urlBase = "https://economia.awesomeapi.com.br/json/";

  return urlBase + coinOne.name.toString() + "-" + coinTwo.name.toString();
}
