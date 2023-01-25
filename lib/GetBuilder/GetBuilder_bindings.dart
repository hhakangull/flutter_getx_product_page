import 'package:get/get.dart';

import './GetBuilder_controller.dart';

class GetBuilderBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(GetBuilderController());
  }
}
