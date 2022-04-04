class CotacaoController {
  String _moedaEscolhida;

  List<String> _listaDeMoedas = [
    'Real',
    'Dólar Americano ',
    'Libra Esterlina',
    'Iene',
    'Peso Argentino'
  ];

  CotacaoController(this._moedaEscolhida, this._listaDeMoedas);

  void atualizaLista(String moedaEscolhida) {
    _listaDeMoedas.remove(moedaEscolhida);
  }

  List<String> getLista() {
    return _listaDeMoedas;
  }
}
