import 'package:flutter/material.dart';
import 'package:moedas_app/controllers/moeda_base_controller.dart';
import 'package:moedas_app/pages/moeda_base_page.dart';
import 'package:moedas_app/pages/resultado_page.dart';

class CotacaoPage extends StatelessWidget {
  String _moedaEscolhida;
  MoedaBaseController _controller = MoedaBaseController();

  CotacaoPage(this._moedaEscolhida, this._controller);

  initController() {
    _controller.atualizaLista(_moedaEscolhida);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cotação'),
          bottomOpacity: 0,
          backgroundColor: Colors.grey.shade900,
          foregroundColor: Colors.blue.shade700,
        ),
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: ListView.builder(
              itemCount: _controller.listaDeMoedas.length,
              padding: EdgeInsets.only(top: 10),
              itemBuilder: (context, index) => Card(
                    borderOnForeground: false,
                    color: Colors.grey.shade800,
                    elevation: 6,
                    margin: EdgeInsets.all(6),
                    child: ListTile(
                      minLeadingWidth: 20,
                      leading: const Icon(Icons.attach_money),
                      title: Text(
                        _controller.listaDeMoedas[index],
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ResultadoPage(),
                            ));
                      },
                    ),
                  )),
        ));
  }
}
