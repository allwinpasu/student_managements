import 'dart:io';

import 'package:get/get.dart';
import '../models/student_model.dart';
import '../services/firebase_service.dart';
import '../services/pdf_service.dart';
import 'package:pdf/widgets.dart' as pdfLib; // Import necessary PDF library
import 'package:path_provider/path_provider.dart';

class StudentsController extends GetxController {

  final FirebaseService _firebaseService = Get.find();

  final PdfService _pdfService = PdfService();

  var students = <StudentModel>[].obs;

  @override
  void onInit() {
    fetchStudents();
    super.onInit();
  }

  void fetchStudents() async {
    students.value = await _firebaseService.getStudents();
  }

  void exportStudentsAsPdf() {
    PdfService().exportStudentsAsPdf(students.toList());
  }



}

