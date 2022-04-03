abstract class ModelUrlAPI {
  static String get _base => 'https://economia.awesomeapi.com.br/';

  static String getURlForRoutePath(String controller) {
    return _base + '/' + controller;
  }
}
