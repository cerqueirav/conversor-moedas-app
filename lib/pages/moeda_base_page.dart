import 'package:flutter/material.dart';
import 'package:moedas_app/controllers/moeda_base_controller.dart';
import 'package:moedas_app/pages/cotacao_page.dart';
import 'package:moedas_app/utils/colors/colors.dart';

class MoedaBasePage extends StatelessWidget {
  final _controller = MoedaBaseController();
  @override
  Widget build(BuildContext context) {
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
                'Moeda Base',
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
                'Selecione uma moeda base para as conversões',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                ),
                textAlign: TextAlign.center,
              ),
              height: 48,
              width: 300,
            ),
            Center(
                child: Container(
              height: 570,
              width: 380,
              child: ListView.builder(
                  itemCount: _controller.listaDeMoedas.length,
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 12),
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
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CotacaoPage(
                                      _controller.listaDeMoedas[index].name),
                                ));
                          },
                        ),
                      )),
            )),
          ],
        )));
  }
}
