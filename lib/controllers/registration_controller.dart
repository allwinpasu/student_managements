import 'package:get/get.dart';
import '../services/firebase_service.dart';

class RegistrationController extends GetxController {
  final FirebaseService _firebaseService = Get.find();
  var email = ''.obs;
  var password = ''.obs;
  var confirmPassword = ''.obs;

  void register() async {
    if (password.value != confirmPassword.value) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    try {
      await _firebaseService.registerWithEmailAndPassword(email.value, password.value);
      Get.offAllNamed('/login');
    } catch (e) {
      Get.snackbar('Registration Error', e.toString());
    }
  }
}
