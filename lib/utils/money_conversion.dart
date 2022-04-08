import 'package:moedas_app/utils/Enum/coin.dart';

String selectCoin(String coinOne, String coinTwo) {
  String urlBase = "https://economia.awesomeapi.com.br/json/";

  return urlBase + coinOne + "-" + coinTwo;
}

bool isContained(List<Coin> lista, Coin coin) {
  for (int i = 0; i < lista.length; i++) {
    Coin value = lista.elementAt(i);
    if (value.name == coin.name) {
      return true;
    }
  }
  return false;
}
