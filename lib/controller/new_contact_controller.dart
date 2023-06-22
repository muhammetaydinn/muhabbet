import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants.dart';
import '../widgets/error_snackbar.dart';
import 'constants.dart';
import 'login_controller.dart';

class NewContactController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  String get name => nameController.text;

  final TextEditingController contactIdController = TextEditingController();
  String get contactId => contactIdController.text;

  saveContact() async {
    String? userId = Get.find<LoginController>().loginModel.value.data?.id;

    var requestUrl = '$baseUrl/api/users/$userId/add-contact/$contactId';
    String? tokenFromModel =
        Get.find<LoginController>().loginModel.value.access_token;
    var headers = {
      'Authorization': 'Bearer: $tokenFromModel',
      'Content-Type': 'application/json'
    };
    var body = {};

    try {
      var response = await http.post(Uri.parse(requestUrl),
          headers: headers, body: json.encode(body));

      if (response.statusCode >= 200 && response.statusCode < 300) {
        getSnackBar(success, response.body, Colors.green, Colors.black);

        //TODO: REFRESH USER CONTACT LIST HERE

        Navigator.pop(Get.context!);
        //clear text fields
        nameController.clear();
        contactIdController.clear();
      } else {
        getSnackBar(error, response.body, Colors.red, Colors.white);
      }
    } catch (error) {
      // Hata durumunda
      Get.snackbar(
        'Hata',
        'Bir hata oluştu: $error',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
