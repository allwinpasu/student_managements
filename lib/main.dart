import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Import Firebase Core
import 'package:get/get.dart';
import 'package:student_management/views/students_list_view.dart';
import 'bindings/initial_binding.dart';
import 'controllers/students_controller.dart';
import 'routes/app_routes.dart';
import 'services/firebase_service.dart'; // Import the FirebaseService
import 'views/login_view.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  if(kIsWeb){
   await Firebase.initializeApp(options:
        const FirebaseOptions(
            apiKey: "AIzaSyB15o0rJvLWo4P8H21P34a1kQQFmjT5zgw",
            authDomain: "studentmanagement-15984.firebaseapp.com",
            projectId: "studentmanagement-15984",
            storageBucket: "studentmanagement-15984.appspot.com",
            messagingSenderId: "457888014266",
            appId: "1:457888014266:web:e5967b570832799d7e8783",
            measurementId: "G-CHWEQTGQYQ"
        ),


    );
  }else{
    await Firebase.initializeApp(); // Initialize Firebase

  }
  Get.put(FirebaseService()); // Initialize the FirebaseService
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: InitialBinding(),
      initialRoute: '/login',
      getPages: AppRoutes.routes,
        //home :StudentsListView()
    );
  }
}