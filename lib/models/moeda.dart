class MoedaModel {
  final int _id;
  final String _name;
  final double _price;

  MoedaModel(this._id, this._name, this._price);

  int getId() {
    return _id;
  }

  String getName() {
    return _name;
  }

  double getPrice() {
    return _price;
  }
}
