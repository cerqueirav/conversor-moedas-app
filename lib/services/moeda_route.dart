import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:moedas_app/models/moeda.dart';
import 'package:moedas_app/utils/Enum/coin.dart';
import 'package:moedas_app/utils/money_conversion.dart';

class MoedaRoute {
  Future<List<Moeda>?> converterMoedas(Coin coinOne, Coin coinTwo) async {
    var url = Uri.parse(selectCoin(coinOne.name, coinTwo.name));

    var response = await http.get(url);

    if (response.statusCode == 200) {
      Iterable lista = json.decode(response.body);
      List<Moeda> moedas = lista.map((model) => Moeda.fromJson(model)).toList();
      log(moedas.length.toString());
      return moedas;
    }
    return null;
  }

  Future<String?> buscarValor(Coin coinOne, Coin coinTwo) async {
    final result = await converterMoedas(coinOne, coinTwo);

    return result?.first.bid;
  }
}
