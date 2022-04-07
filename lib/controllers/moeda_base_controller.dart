import 'package:flutter/material.dart';
import 'package:moedas_app/models/coin_model.dart';
import 'package:moedas_app/services/moeda_route.dart';
import 'package:moedas_app/utils/Enum/coin.dart';

class MoedaBaseController extends ChangeNotifier {
  late Coin moedaEscolhida;
  List<Coin> listaDeMoedas = fetchCoins();
  List<Coin> listaProxima = [];
  List<CoinModel> listaCoinModel = [];

  void setMoedaEscolhida(Coin moedaEscolhida) {
    this.moedaEscolhida = moedaEscolhida;
  }

  Coin getSelectedCoin() {
    return moedaEscolhida;
  }

  List<Coin> getLista() {
    return listaDeMoedas;
  }

  void atualizaLista() {
    for (int i = 0; i < listaDeMoedas.length; i++) {
      if (listaDeMoedas.elementAt(i).name.toString() == moedaEscolhida.name) {
        listaDeMoedas.remove(listaDeMoedas.elementAt(i));
      }
    }
    notifyListeners();
  }

  void fetchCoinModel() async {
    for (int i = 0; i < listaProxima.length; i++) {
      final repository = await MoedaRoute()
          .buscarValor(moedaEscolhida, listaProxima.elementAt(i));
      listaCoinModel
          .add(CoinModel(listaProxima.elementAt(i), repository.toString()));
      notifyListeners();
    }
  }
}
