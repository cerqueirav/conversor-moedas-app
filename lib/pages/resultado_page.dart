import 'dart:async';

import 'package:flutter/material.dart';
import 'package:moedas_app/controllers/moeda_base_controller.dart';
import 'package:moedas_app/pages/moeda_base_page.dart';
import 'package:moedas_app/utils/Enum/coin.dart';
import 'package:moedas_app/utils/colors/colors.dart';

class ResultadoPage extends StatefulWidget {
  final MoedaBaseController _controller;
  ResultadoPage(this._controller);

  @override
  State<ResultadoPage> createState() => _ResultadoPageState();
}

class _ResultadoPageState extends State<ResultadoPage> {
  @override
  void initState() {
    widget._controller.atualizaLista();
    widget._controller.fetchCoinModel();
    super.initState();
    Timer(Duration(seconds: 1), () => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    var moedaNome = getNameCoin(widget._controller.moedaEscolhida.name);

    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 5, vertical: 8),
              height: 40,
              width: 150,
              child: Text(
                'Resultado',
                style: TextStyle(
                    fontSize: 24,
                    color: titleCardColor,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 1, vertical: 3),
              child: Text(
                'Confira os valores de compra referentes ao $moedaNome',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              height: 48,
              width: 380,
            ),
            Center(
                child: Column(
              children: [
                Container(
                    height: 450,
                    width: 380,
                    child: RefreshIndicator(
                      onRefresh: () => _refresh(),
                      child: ListView.builder(
                          itemCount: widget._controller.listaCoinModel.length,
                          padding:
                              EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                          itemBuilder: (context, index) => Card(
                                borderOnForeground: false,
                                color: Colors.grey.shade800,
                                elevation: 3,
                                margin: EdgeInsets.all(7),
                                child: Container(
                                  child: ListTile(
                                    trailing: Text(
                                      widget._controller.listaCoinModel[index]
                                          .price,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    minLeadingWidth: 10,
                                    leading: const Icon(
                                      Icons.attach_money,
                                      color: backgroundIconColor,
                                    ),
                                    title: Text(
                                      getNameCoin(widget._controller
                                          .listaCoinModel[index].coin.name),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    onTap: () {
                                      // Criar lógica
                                    },
                                  ),
                                ),
                              )),
                    )),
                Container(
                  padding: EdgeInsetsDirectional.all(20),
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                      backgroundColor: titleCardColor,
                    ),
                    child: Text(
                      'Concluir',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      /*
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MoedaBasePage(),
                          ));
                      */
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 165),
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(1),
                        height: 10,
                        child: Icon(
                          Icons.circle,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(1),
                        height: 10,
                        child: Icon(
                          Icons.circle,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(1),
                        height: 10,
                        width: 10,
                        child: Icon(
                          Icons.circle,
                          color: Colors.blue.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
          ],
        )));
  }

  Future<void> _refresh() {
    return Future.delayed(Duration(seconds: 0));
  }
}
