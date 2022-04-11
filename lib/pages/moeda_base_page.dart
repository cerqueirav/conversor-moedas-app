import 'package:flutter/material.dart';
import 'package:moedas_app/controllers/moeda_base_controller.dart';
import 'package:moedas_app/pages/cotacao_page.dart';
import 'package:moedas_app/utils/Enum/coin.dart';
import 'package:moedas_app/utils/colors/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class MoedaBasePage extends StatefulWidget {
  @override
  State<MoedaBasePage> createState() => _MoedaBasePageState();
}

class _MoedaBasePageState extends State<MoedaBasePage> {
  int _selectedIndex = 0;
  MoedaBaseController _controller = MoedaBaseController();

  PageController _pageController = PageController(initialPage: 1);

  List<bool> selecionados = [false, false, false, false, false];

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
              width: 250,
            ),
            Center(
                child: Container(
              height: 500,
              width: 350,
              child: RefreshIndicator(
                onRefresh: _refresh,
                child: ListView.builder(
                    itemCount: _controller.listaDeMoedas.length,
                    padding: EdgeInsets.symmetric(horizontal: 1, vertical: 40),
                    itemBuilder: (context, index) => Card(
                          borderOnForeground: true,
                          color: Colors.grey.shade800,
                          elevation: 5,
                          margin:
                              EdgeInsets.symmetric(horizontal: 1, vertical: 8),
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
                              getNameCoin(
                                  _controller.listaDeMoedas[index].name),
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
                              _controller.moedaEscolhida =
                                  _controller.listaDeMoedas[index];
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          CotacaoPage(_controller)),
                                  (Route<dynamic> route) => false);
                            },
                          ),
                        )),
              ),
            )),
            Container(
              padding: EdgeInsets.symmetric(vertical: 25, horizontal: 165),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 1),
                    height: 1,
                    child: Icon(
                      Icons.circle,
                      color: Colors.blue.shade800,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 1),
                    height: 1,
                    child: Icon(
                      Icons.circle,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 1),
                    height: 1,
                    child: Icon(
                      Icons.circle,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        )));
  }

  Future<void> _refresh() {
    return Future.delayed(Duration(seconds: 0));
  }
}
