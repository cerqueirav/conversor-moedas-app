import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:moedas_app/models/Moeda.dart';

Future<List<Moeda>?> listar() async {
  var url = Uri.parse("https://economia.awesomeapi.com.br/json/EUR-BRL/");
  var response = await http.get(url);

  if (response.statusCode == 200) {
    Iterable lista = json.decode(response.body);
    List<Moeda> moedas = lista.map((model) => Moeda.fromJson(model)).toList();
    log(moedas.length.toString());
    return moedas;
  }
  return null;
}
