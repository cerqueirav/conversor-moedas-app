import 'package:moedas_app/utils/Enum/coin.dart';

class MoedaBaseController {
  List<Coin> listaDeMoedas = fetchCoins();

  List<Coin> getLista() {
    return listaDeMoedas;
  }

  void atualizaLista(String moedaEscolhida) {
    for (int i = 0; i < listaDeMoedas.length; i++) {
      if (listaDeMoedas.elementAt(i).name.toString() == moedaEscolhida) {
        listaDeMoedas.remove(listaDeMoedas.elementAt(i));
      }
    }
  }

  String getMoedaName(String siglaMoeda) {
    switch (siglaMoeda) {
      case 'ARS':
        {
          return 'Peso Argentino';
        }
      case 'BRL':
        {
          return 'Real';
        }
      case 'GBP':
        {
          return 'Libra Esterlina';
        }
      case 'JPY':
        {
          return 'Iene';
        }
      case 'USD':
        {
          return 'Dólar Americano';
        }
      default:
        {
          return 'Erro';
        }
    }
  }
}
