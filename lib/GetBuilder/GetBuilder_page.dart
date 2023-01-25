// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './GetBuilder_controller.dart';

@immutable
class GetBuilderPage extends GetView<GetBuilderController> {
  GetBuilderPage({Key? key}) : super(key: key);

  var myController = Get.put(GetBuilderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('GetBuilderPage'),
      ),
      body: Center(
        child: Container(
          color: Colors.amber,
          child: GetBuilder<GetBuilderController>(
            //init: GetBuilderController(),
            builder: (controller) => Text(
              "The value is \n${controller.count}",
              style: const TextStyle(fontSize: 56),
            ),
          ),
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              //Get.find<GetBuilderController>().increment();
              myController.increment();
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () {
              //Get.find<GetBuilderController>().decrement();
              myController.decrement();
            },
            child: const Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}
