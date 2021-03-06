import 'dart:convert';

import 'package:contactapp/contact_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as https;
import 'package:http/http.dart' as http;

class Service {
  static const String _dataUrl =
      "https://629dce7c3dda090f3c0b91c0.mockapi.io/api/contacts";
  var client = https.Client;

  static Future<ContactListModel> getData() async {
    // https.Response? response;
    late ContactListModel dataList;

    try {
      Uri url = Uri.parse(_dataUrl);
      // response = await client.;
      var res = await https.get(url);

      if (res.statusCode == 200) {
        var data = jsonDecode(res.body);

        dataList = ContactListModel.fromJson(data);
        return dataList;
      } else {
        return ContactListModel(
            errorModel: ErrorModel(isError: true, statusCode: res.statusCode));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return ContactListModel(
        errorModel: ErrorModel(isError: true, statusCode: 400));
  }

  Future<int> createContact(
      {required String name,
      required String position,
      required String city,
      required String description,
      required String phone,
      required String homeNumber,
      required String email,
      required String socialId}) async {
    final response = await http.post(
      Uri.parse('https://629dce7c3dda090f3c0b91c0.mockapi.io/api/contacts'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'job': position,
        'city': city,
        'description': description,
        'phone': phone,
        'home_number': homeNumber,
        'email': email,
        'social_id': socialId
      }),
    );
    return response.statusCode;
    // if (response.statusCode == 201) {
    //   return ContactModel.fromJson(jsonDecode(response.body));
    // } else {
    //   throw Exception('Failed to create contact');
    // }
  }

  Future<int> deleteContact(String id) async {
    final http.Response response = await http.delete(
      Uri.parse('https://629dce7c3dda090f3c0b91c0.mockapi.io/api/contacts/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    return response.statusCode;
  }

  Future<int> updateContact({
    required String name,
    required String position,
    required String city,
    required String description,
    required String phone,
    required String homeNumber,
    required String email,
    required String socialId,
    required String id,
  }) async {
    final response = await http.put(
      Uri.parse('https://629dce7c3dda090f3c0b91c0.mockapi.io/api/contacts/$id'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'name': name,
        'job': position,
        'city': city,
        'description': description,
        'phone': phone,
        'home_number': homeNumber,
        'email': email,
        'social_id': socialId,
        'id': id,
      }),
    );
    return response.statusCode;
    // if (response.statusCode == 200) {
    //   return ContactModel.fromJson(jsonDecode(response.body));
    // } else {
    //   throw Exception('Failed to update contact');
    // }
  }
}
