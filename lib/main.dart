import 'package:flutter/material.dart';
import 'package:moedas_app/pages/moeda_base_page.dart';
import 'package:moedas_app/services/moeda_route.dart';
import 'package:moedas_app/utils/Enum/coin.dart';

void main() async {
  final repository = await converterMoedas(Coin.BRL, Coin.USD);
  print(repository?.first.name);
  print(repository?.first.bid);
  print(repository?.first.code);
  print(repository?.first.codein);

  runApp(MaterialApp(debugShowCheckedModeBanner: false, home: MoedaBasePage()));
}
