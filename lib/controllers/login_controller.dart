import 'package:get/get.dart';
import '../services/firebase_service.dart';

class LoginController extends GetxController {
  final FirebaseService _firebaseService = Get.find();
  var email = ''.obs;
  var password = ''.obs;

  void login() async {
    try {
      await _firebaseService.signInWithEmailAndPassword(email.value, password.value);
      Get.offAllNamed('/students-list');
    } catch (e) {
      Get.snackbar('Login Error', e.toString());
    }
  }
}
