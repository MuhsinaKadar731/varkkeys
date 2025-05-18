import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 0)
class Contact extends HiveObject {
  @HiveField(0)
  String first_name;

  @HiveField(1)
  String last_name;

  @HiveField(2)
  String phone;

  @HiveField(3)
  String email;

  @HiveField(4)
  String address;

  @HiveField(5)
  int age;

  @HiveField(6)
  String qualification;

  @HiveField(7)
  String interested_area;

  @HiveField(8)
  String current_role;

  @HiveField(9)
  String status;

  @HiveField(10)
  String remarks;

  @HiveField(11)
  String requirements_of_candidate;

  @HiveField(12)
  String assigned_to;

  Contact({
    required this.first_name,
    required this.last_name,
    required this.phone,
    required this.email,
    required this.address,
    required this.age,
    required this.qualification,
    required this.interested_area,
    required this.current_role,
    required this.status,
    required this.remarks,
    required this.requirements_of_candidate,
    required this.assigned_to,
  });

  factory Contact.fromJson(Map<String, dynamic> json) {
    return Contact(
      first_name: json['first_name'] ?? '',
      last_name: json['last_name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      age: json['age'] != null ? int.tryParse(json['age'].toString()) ?? 0 : 0,
      qualification: json['qualification'] ?? '',
      interested_area: json['interested_area'] ?? '',
      current_role: json['current_role'] ?? '',
      status: json['status'] ?? '',
      remarks: json['remarks'] ?? '',
      requirements_of_candidate: json['requirements_of_candidate'] ?? '',
      assigned_to: json['assigned_to'] ?? ''
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': first_name,
      'last_name': last_name,
      'phone': phone,
      'email': email,
      'address': address,
      'age': age,
      'qualification': qualification,
      'interested_area': interested_area,
      'current_role': current_role,
      'status': status,
      'remarks': remarks,
      'requirements_of_candidate': requirements_of_candidate,
    };
  }

  @override
  String toString() {
    return 'Contact('
        'firstName: $first_name, '
        'lastName: $last_name, '
        'phone: $phone, '
        'email: $email, '
        'address: $address, '
        'age: $age, '
        'qualification: $qualification, '
        'interestedArea: $interested_area, '
        'currentRole: $current_role, '
        'status: $status, '
        'remarks: $remarks, '
        'requirements: $requirements_of_candidate'
        ')';
  }
}
