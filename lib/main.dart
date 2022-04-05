import 'package:flutter/material.dart';
import 'package:moedas_app/pages/moeda_base_page.dart';
import 'package:moedas_app/services/moeda_route.dart';
import 'package:moedas_app/utils/Enum/coins.dart';

void main() async {
  final repository = await converterMoedas(Coin.BRL, Coin.EUR);
  print(repository?.first.name);

  runApp(MaterialApp(home: MoedaBasePage()));
}
