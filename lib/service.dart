import 'dart:convert';

import 'package:contactapp/contact_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;

class Service {
  final String _dataUrl =
      "https://629dce7c3dda090f3c0b91c0.mockapi.io/api/contacts";
  var client = https.Client;

  Future<List<ContactModel>?> getData() async {
    // https.Response? response;
    List<ContactModel>? dataList;

    try {
      Uri url = Uri.parse(_dataUrl);
      // response = await client.;
      var res = await https.get(url);
      var data = jsonDecode(res.body);

      dataList = List.from(data.map((val) => ContactModel.fromJson(val)));
    } catch (e) {
      debugPrint(e.toString());
    }
    return dataList;
  }
}
