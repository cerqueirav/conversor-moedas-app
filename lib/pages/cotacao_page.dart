import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:moedas_app/controllers/moeda_base_controller.dart';
import 'package:moedas_app/pages/resultado_page.dart';
import 'package:moedas_app/utils/Enum/coin.dart';
import 'package:moedas_app/utils/colors/colors.dart';

class CotacaoPage extends StatefulWidget {
  MoedaBaseController _controller;
  CotacaoPage(this._controller);

  @override
  State<CotacaoPage> createState() => _CotacaoPageState();
}

class _CotacaoPageState extends State<CotacaoPage> {
  List<bool> selecionados = [false, false, false, false, false];
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Color getColor(int index) {
      if (selecionados[index] != false) {
        return titleCardColor;
      }
      return Colors.white;
    }

    Color getColorBorder(int index) {
      if (selecionados[index] != false) {
        return titleCardColor;
      }
      return Colors.grey.shade900;
    }

    var moedaNome = getNameCoin(widget._controller.moedaEscolhida.name);
    widget._controller.atualizaLista();
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
                'Cotação',
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
                'Selecione as moedas a serem cotadas na moeda $moedaNome',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              height: 48,
              width: 250,
            ),
            Center(
                child: Column(
              children: [
                Container(
                  height: 500,
                  width: 350,
                  child: RefreshIndicator(
                    onRefresh: _refresh,
                    child: ListView.builder(
                        itemCount: widget._controller.listaDeMoedas.length,
                        padding:
                            EdgeInsets.symmetric(horizontal: 1, vertical: 40),
                        itemBuilder: (context, index) => Card(
                              borderOnForeground: false,
                              color: Colors.grey.shade800,
                              elevation: 3,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 1, vertical: 8),
                              child: ListTile(
                                shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        color: getColorBorder(index), width: 3),
                                    borderRadius: BorderRadius.circular(5)),
                                minLeadingWidth: 10,
                                leading: Icon(
                                  Icons.attach_money,
                                  color: getColor(index),
                                ),
                                title: Text(
                                  getNameCoin(widget
                                      ._controller.listaDeMoedas[index].name),
                                  style: TextStyle(
                                      color: getColor(index),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                onTap: () {
                                  setState(() {
                                    selecionados[index] = true;
                                  });
                                  _refresh();
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                  bool isContained = widget._controller
                                      .isContained(
                                          widget._controller.listaProxima,
                                          widget._controller
                                              .listaDeMoedas[index]);
                                  if (!isContained) {
                                    widget._controller.listaProxima.add(widget
                                        ._controller.listaDeMoedas[index]);
                                  }
                                },
                              ),
                            )),
                  ),
                ),
                Container(
                  height: 40,
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 15),
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    style: TextButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                      backgroundColor: titleCardColor,
                    ),
                    child: Text(
                      'Próximo',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (context) =>
                                  ResultadoPage(widget._controller)),
                          (Route<dynamic> route) => false);
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
                          color: Colors.blue.shade800,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(1),
                        height: 10,
                        width: 10,
                        child: Icon(
                          Icons.circle,
                          color: Colors.white,
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
