import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../common/constants.dart';

class Servicereq {
  connectivityFunc(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print('mobile');
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print('wifi');
    } else if (connectivityResult == ConnectivityResult.none) {
      print('no connect');
      snackbar("Your Device is not connected with internet", context);
    }
  }

  static Future<bool> connectivityFunction(BuildContext context) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      print('mobile');
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      print('wifi');
      return true;
    } else if (connectivityResult == ConnectivityResult.none) {
      return false;
    }

    return true;
  }

  void snackbar(String msg, BuildContext context) {
    var snackBar = SnackBar(
      content: Text(msg),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  Future<http.Response> fetchdataget(BuildContext context) async {
    connectivityFunc(context);

    String mainurl = Constants.baseurl;
    var response = await http.get(Uri.parse(mainurl));

    return response;
  }
}
