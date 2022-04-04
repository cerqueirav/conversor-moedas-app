import 'package:flutter/material.dart';
import 'package:moedas_app/controllers/moeda_base_controller.dart';

class CotacaoPage extends StatelessWidget {
  String _moedaEscolhida;
  MoedaBaseController controller = MoedaBaseController();

  CotacaoPage(this._moedaEscolhida, this.controller);

  initController() {
    controller.atualizaLista(_moedaEscolhida);
  }

  @override
  Widget build(BuildContext context) {
    initController();
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
            title: Center(
                child: Text(
              'Cotação',
            )),
            backgroundColor: Colors.grey.shade800),
        body: SafeArea(
            child: ListView.builder(
          itemCount: controller.listaDeMoedas.length,
          itemBuilder: (context, index) => Card(
            shadowColor: Colors.amberAccent,
            elevation: 6,
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: const Icon(Icons.attach_money),
              title: Text(
                controller.listaDeMoedas[index],
              ),
            ),
          ),
        )));
  }
}
