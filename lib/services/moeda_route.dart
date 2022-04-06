import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:moedas_app/models/Moeda.dart';
import 'package:moedas_app/utils/Enum/coin.dart';
import 'package:moedas_app/utils/money_Conversion.dart';

Future<List<Moeda>?> converterMoedas(Coin coinOne, Coin coinTwo) async {
  var url = Uri.parse(selectCoin(coinOne, coinTwo));

  var response = await http.get(url);

  if (response.statusCode == 200) {
    Iterable lista = json.decode(response.body);
    List<Moeda> moedas = lista.map((model) => Moeda.fromJson(model)).toList();
    log(moedas.length.toString());
    return moedas;
  }
  return null;
}
