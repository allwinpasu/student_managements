import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/student_model.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserCredential> signInWithEmailAndPassword(String email, String password) async {
    return await _auth.signInWithEmailAndPassword(email: email, password: password);
  }

  Future<UserCredential> registerWithEmailAndPassword(String email, String password) async {
    return await _auth.createUserWithEmailAndPassword(email: email, password: password);
  }

  Future<void> signOut() async {
    return await _auth.signOut();
  }

  bool isUserLoggedIn() {
    return _auth.currentUser != null;
  }

  Future<List<StudentModel>> getStudents() async {
    var snapshot = await _firestore.collection('students').get();
    return snapshot.docs.map((doc) => StudentModel.fromMap(doc.data())).toList();
  }

  Future<void> addStudent(StudentModel student) async {
    await _firestore.collection('students').add(student.toMap());
  }
}
