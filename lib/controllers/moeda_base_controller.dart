class MoedaBaseController {
  List<String> listaDeMoedas = [
    'Real',
    'Dólar Americano ',
    'Libra Esterlina',
    'Iene',
    'Peso Argentino'
  ];

  void atualizaLista(String moedaEscolhida) {
    listaDeMoedas.remove(moedaEscolhida);
  }

  List<String> getLista() {
    return listaDeMoedas;
  }
}
