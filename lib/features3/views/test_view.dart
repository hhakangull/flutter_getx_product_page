import 'package:flutter/material.dart';
import 'package:getx_example/features3/controller/test_controller.dart';

class TestView extends StatelessWidget {
  TestView({Key? key}) : super(key: key);

  final controller = TestController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test View'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                // var response = await BaseClient().get(baseUrl, api);
                // log(response);
                controller.getData();
              },
              child: const Text('GetData'),
            ),
            ElevatedButton(
              onPressed: () async {
                // var response = await BaseClient().get(baseUrl, api);
                // log(response);
                controller.postData();
              },
              child: const Text('PostData'),
            ),
          ],
        ),
      ),
    );
  }
}
