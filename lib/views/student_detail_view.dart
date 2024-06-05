import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/student_detail_controller.dart';

class StudentDetailView extends StatelessWidget {
  final StudentDetailController controller = Get.find<StudentDetailController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Detail')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (value) => controller.student.value.name = value,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              onChanged: (value) => controller.student.value.email = value,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              onChanged: (value) => controller.student.value.age = int.parse(value),
              decoration: InputDecoration(labelText: 'Age'),
            ),
            TextField(
              onChanged: (value) => controller.student.value.gender = value,
              decoration: InputDecoration(labelText: 'Gender'),
            ),
            TextField(
              onChanged: (value) => controller.student.value.address = value,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            TextField(
              onChanged: (value) => controller.student.value.phoneNumber = value,
              decoration: InputDecoration(labelText: 'Phone Number'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Get.back(result: controller.student.value);
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}
