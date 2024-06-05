import 'package:get/get.dart';
import '../bindings/login_binding.dart';
import '../bindings/registration_binding.dart';
import '../bindings/student_detail_binding.dart';
import '../bindings/students_list_binding.dart';
import '../views/login_view.dart';
import '../views/registration_view.dart';
import '../views/student_detail_view.dart';
import '../views/students_list_view.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/login', page: () => LoginView(), binding: LoginBinding()),
    GetPage(name: '/registration', page: () => RegistrationView(), binding: RegistrationBinding()),
    GetPage(name: '/students-list', page: () => StudentsListView(), binding: StudentsListBinding()),
    GetPage(name: '/student-detail', page: () => StudentDetailView(), binding: StudentDetailBinding()),
  ];
}
