import 'package:get/get.dart';
import '../controllers/students_controller.dart';

class StudentsListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => StudentsController());
  }
}
