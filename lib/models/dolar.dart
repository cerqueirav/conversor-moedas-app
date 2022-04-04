import 'package:json_annotation/json_annotation.dart';

@JsonSerializable(explicitToJson: true)
class Dolar {
  int _id;
  String _name;
  double _price;

  Dolar(this._id, this._name, this._price);

  factory Dolar.fromJson(Map<String, dynamic> json) => _$DolarFromJson(json);

  Map<String, dynamic> toJson() => _$DolarToJson(this);
}

Dolar _$DolarFromJson(Map<String, dynamic> json) {
  return Dolar(
    json['id'] as int,
    json['name'] as String,
    json['price'] as double,
  );
}

Map<String, dynamic> _$DolarToJson(Dolar instance) => <String, dynamic>{
      'id': instance._id,
      'name': instance._name,
      'price': instance._price,
    };
