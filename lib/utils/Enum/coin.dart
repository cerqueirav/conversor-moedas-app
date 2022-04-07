enum Coin {
  ARS, // Peso argentino
  BRL, // Real
  GBP, // Libra esterlina
  JPY, // Iene
  USD, // Dólar
}

List<Coin> fetchCoins() {
  List<Coin> listaCoin = [Coin.BRL, Coin.USD, Coin.GBP, Coin.JPY, Coin.ARS];
  return listaCoin;
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

String getNameCoin(String siglaMoeda) {
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
