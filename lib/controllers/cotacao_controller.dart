import 'package:moedas_app/utils/Enum/coin.dart';

class CotacaoController {
  List<Coin> listaDeMoedas = fetchCoins();
  String moedaEscolhida;

  CotacaoController(this.moedaEscolhida);

  void atualizaLista(String moedaEscolhida) {
    for (int i = 0; i < listaDeMoedas.length; i++) {
      if (listaDeMoedas.elementAt(i).name.toString() == moedaEscolhida) {
        listaDeMoedas.remove(listaDeMoedas.elementAt(i));
      }
    }
  }

  List<Enum> getLista() {
    return listaDeMoedas;
  }
}
