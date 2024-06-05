import 'package:get/get.dart';
import 'package:student_management/controllers/students_controller.dart';
import '../controllers/login_controller.dart';
import '../services/firebase_service.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(FirebaseService());
    Get.put(StudentsController());

  }
}
