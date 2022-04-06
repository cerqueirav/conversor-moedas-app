enum Coin {
  ARS, // Peso argentino
  BRL, // Real
  GBP, // Libra esterlina
  JPY, // Iene
  USD, // Dólar
}

List<Coin> fetchCoins() {
  List<Coin> lista = [Coin.BRL, Coin.USD, Coin.GBP, Coin.JPY, Coin.ARS];
  return lista;
}
