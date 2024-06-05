import 'package:get/get.dart';
import '../models/student_model.dart';

class StudentDetailController extends GetxController {
  var student = StudentModel().obs;

  void setStudent(StudentModel student) {
    this.student.value = student;
  }
}
