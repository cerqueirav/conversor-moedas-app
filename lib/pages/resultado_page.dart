import 'package:flutter/material.dart';
import 'package:moedas_app/controllers/cotacao_controller.dart';
import 'package:moedas_app/controllers/moeda_base_controller.dart';
import 'package:moedas_app/models/Moeda.dart';
import 'package:moedas_app/pages/moeda_base_page.dart';
import 'package:moedas_app/utils/colors/colors.dart';

class ResultadoPage extends StatelessWidget {
  String moedaEscolhida;
  final _controller = MoedaBaseController();

  ResultadoPage(this.moedaEscolhida);

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "Resultado",
        theme: new ThemeData(primarySwatch: Colors.grey),
        debugShowCheckedModeBanner: false,
        home: new ListViewBuilder(_controller, moedaEscolhida));
  }
}

class ListViewBuilder extends StatelessWidget {
  MoedaBaseController _controller = MoedaBaseController();
  String moedaEscolhida;

  ListViewBuilder(this._controller, this.moedaEscolhida);
  @override
  Widget build(BuildContext context) {
    var moedaNome = _controller.getMoedaName(moedaEscolhida);
    _controller.atualizaLista(moedaEscolhida);
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
                  child: ListView.builder(
                      itemCount: _controller.listaDeMoedas.length,
                      padding:
                          EdgeInsets.symmetric(horizontal: 5, vertical: 12),
                      itemBuilder: (context, index) => Card(
                            borderOnForeground: false,
                            color: Colors.grey.shade800,
                            elevation: 3,
                            margin: EdgeInsets.all(7),
                            child: ListTile(
                              minLeadingWidth: 10,
                              leading: const Icon(
                                Icons.attach_money,
                                color: backgroundIconColor,
                              ),
                              title: Text(
                                _controller.getMoedaName(
                                    _controller.listaDeMoedas[index].name),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400),
                              ),
                              onTap: () {
                                _controller.listaProxima
                                    .add(_controller.listaDeMoedas[index].name);
                              },
                            ),
                          )),
                ),
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MoedaBasePage(),
                          ));
                    },
                  ),
                ),
              ],
            )),
          ],
        )));
  }
}
