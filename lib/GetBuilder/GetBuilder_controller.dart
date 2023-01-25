import 'package:get/get.dart';

class GetBuilderController extends GetxController {
  var count = 0;
  void increment() {
    count++;
    update();
  }

  void decrement() {
    count--;
    update();
  }
}
