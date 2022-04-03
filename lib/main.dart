import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

const request = "https://economia.awesomeapi.com.br/last/";

void main() async {
  //print(await getData());

  runApp(MaterialApp(
    home: Container(),
    theme: ThemeData(hintColor: Colors.amber, primaryColor: Colors.white),
  ));
}
