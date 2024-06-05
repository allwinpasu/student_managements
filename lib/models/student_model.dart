class StudentModel {
  String id;
  String name;
  String email;
  int age;
  String gender;
  String address;
  String phoneNumber;

  StudentModel({
    this.id = '',
    this.name = '',
    this.email = '',
    this.age = 0,
    this.gender = '',
    this.address = '',
    this.phoneNumber = '',
  });

  factory StudentModel.fromMap(Map<String, dynamic> map) {
    return StudentModel(
      id: map['id'],
      name: map['name'],
      email: map['email'],
      age: map['age'],
      gender: map['gender'],
      address: map['address'],
      phoneNumber: map['phoneNumber'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'age': age,
      'gender': gender,
      'address': address,
      'phoneNumber': phoneNumber,
    };
  }
}
