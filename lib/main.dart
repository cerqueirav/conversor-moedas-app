import 'package:moedas_app/controllers/api.dart';

void main() async {
  final repository = await listar();

  print(repository?.first.high);
  //runApp(MaterialApp(home: MoedaBasePage()));
}
