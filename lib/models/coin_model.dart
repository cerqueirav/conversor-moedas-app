import 'package:moedas_app/utils/Enum/coin.dart';

class CoinModel {
  Coin coin;
  String price;

  CoinModel(this.coin, this.price);

  void setCoin(Coin coin) {
    this.coin = coin;
  }

  void setPrice(String price) {
    this.price = price;
  }
}
