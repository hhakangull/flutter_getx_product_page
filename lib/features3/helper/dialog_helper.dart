import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper {
  static void showErrorDialog(
      {String title = 'Error', String description = 'Something went wrong'}) {
    Get.dialog(
      Dialog(
        child: SizedBox(
          height: 200,
          width: 350,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error,
                    color: Colors.red,
                    size: Get.textTheme.headline4!.fontSize,
                  ),
                  const SizedBox(width: 10),
                  Text(title, style: Get.textTheme.headline4),
                ],
              ),
              const Divider(),
              const Spacer(),
              Text(description, style: Get.textTheme.headline6),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: const Text('Okay'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
