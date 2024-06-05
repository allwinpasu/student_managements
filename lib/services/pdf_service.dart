import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';
import 'dart:io';
import 'package:open_file/open_file.dart';
import '../models/student_model.dart';

class PdfService {
  Future<void> exportStudentsAsPdf(List<StudentModel> students) async {
    final pdf = pw.Document();

    pdf.addPage(pw.Page(
      build: (pw.Context context) {
        return pw.Column(
          children: students
              .map((student) => pw.Text('${student.name} - ${student.email} - ${student.age} - ${student.gender} - ${student.address} - ${student.phoneNumber}'))
              .toList(),
        );
      },
    ));

    try {
      final directory = await getExternalStorageDirectory();
      final path = '${directory!.path}/students.pdf';
      final file = File(path);
      await file.writeAsBytes(await pdf.save());

      // Open the PDF file
      OpenFile.open(path);
    } catch (e) {
      print('Error saving or opening PDF: $e');
    }
  }
}
