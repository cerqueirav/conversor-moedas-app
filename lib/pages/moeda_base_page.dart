import 'package:flutter/material.dart';
import 'package:moedas_app/controllers/moeda_base_controller.dart';
import 'package:moedas_app/pages/cotacao_page.dart';

class MoedaBasePage extends StatelessWidget {
  final _controller = MoedaBaseController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Moeda Base'),
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
                              builder: (context) => CotacaoPage(
                                  _controller.listaDeMoedas[index],
                                  _controller),
                            ));
                      },
                    ),
                  )),
        ));
  }
}
