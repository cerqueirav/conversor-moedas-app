import 'package:flutter/material.dart';

class ResultadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: "ListView.builder",
        theme: new ThemeData(primarySwatch: Colors.grey),
        debugShowCheckedModeBanner: false,
        home: new ListViewBuilder());
  }
}

class ListViewBuilder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado'),
        bottomOpacity: 0,
        backgroundColor: Colors.grey.shade900,
        foregroundColor: Colors.blue.shade700,
      ),
      body: ListView.builder(
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
                leading: Icon(Icons.attach_money),
                trailing: Text(
                  "Lista de Moedas[]",
                  style: TextStyle(color: Colors.grey.shade800, fontSize: 15),
                ),
                // Campo que será responsável por apresentar a cotação
                title: Text("$index"));
          }),
    );
  }
}
