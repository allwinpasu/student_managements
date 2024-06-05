import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/students_controller.dart';
import '../models/student_model.dart';

class StudentsListView extends StatelessWidget {
  final StudentsController controller = Get.find<StudentsController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Students List'),
        actions: [
          IconButton(
            icon: Icon(Icons.download),
            onPressed: controller.exportStudentsAsPdf,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.students.isEmpty) {
          return Center(child: Text('No students found'));
        }

        return ListView.builder(
          itemCount: controller.students.length,
          itemBuilder: (context, index) {
            final student = controller.students[index];
            return ListTile(
              title: Text(student.name),
              subtitle: Text(student.email),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Student Details'),
                    content: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Name: ${student.name}'),
                        Text('Email: ${student.email}'),
                        Text('Phone:${student.phoneNumber}')
                        // Add more details here
                      ],
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newStudent = StudentModel();
          final result = await Get.toNamed('/student-detail', arguments: newStudent);
          if (result != null && result is StudentModel) {
            controller.students.add(result);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
