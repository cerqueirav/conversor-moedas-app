import 'package:moedas_app/utils/Enum/coins.dart';

String selectCoin(Coin coinOne, Coin coinTwo) {
  String urlBase = "https://economia.awesomeapi.com.br/json/";

  return urlBase + coinOne.name.toString() + "-" + coinTwo.name.toString();
}
