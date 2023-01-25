import 'dart:developer';

import 'package:getx_example/features3/controller/base_controller.dart';
import 'package:getx_example/features3/views/client.dart';

abstract class ITestController {
  Future<void> getData();
  Future<void> postData();
}

class TestController extends ITestController with BaseController {
  final baseUrl = 'https://jsonplaceholder.typicode.com';
  final api = '/todos/1';
  @override
  Future<void> getData() async {
    var response = await BaseClient().get(baseUrl, api).catchError(handleError);
    if (response == null) return;
    log(response);
  }

  @override
  Future<void> postData() async {
    var request = {'message': 'CodeX sucks!!'};
    var response = await BaseClient()
        .post(baseUrl, '/posts', request)
        .catchError(handleError);
    if (response == null) return;
    log(response);
  }
}
