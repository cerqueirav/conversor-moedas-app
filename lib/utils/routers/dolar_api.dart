import 'package:moedas_app/utils/routers/model_url_api.dart';

class DolarApi {
  static String get _partialPath => ModelUrlAPI.getURlForRoutePath("last");
  String get usdToBrl => _partialPath + "/USD-BRL";
}
