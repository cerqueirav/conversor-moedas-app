import 'package:flutter/material.dart';
import 'package:moedas_app/controllers/moeda_base_controller.dart';

class MoedaBasePage extends StatelessWidget {
  final _controller = MoedaBaseController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
            title: Center(
                child: Text(
              'Moeda Base',
            )),
            backgroundColor: Colors.grey.shade800),
        body: SafeArea(
            child: ListView.builder(
          itemCount: _controller.listaDeMoedas.length,
          itemBuilder: (context, index) => Card(
            shadowColor: Colors.amberAccent,
            elevation: 6,
            margin: EdgeInsets.all(8),
            child: ListTile(
              leading: const Icon(Icons.attach_money),
              title: Text(
                _controller.listaDeMoedas[index],
              ),
            ),
          ),
        )));
  }
}
