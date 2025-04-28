import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 0)
class Contact extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String contactNumber;

  @HiveField(2)
  String status;

  @HiveField(3)
  String qualification;

  @HiveField(4)
  String currentRole;

  @HiveField(5)
  String remarks;

  @HiveField(6)
  String requirements;

  Contact({
    required this.name,
    required this.contactNumber,
    required this.status,
    required this.qualification,
    required this.currentRole,
    required this.remarks,
    required this.requirements,
  });

  @override
  String toString() {
    return 'Contact(name: $name, contactNumber: $contactNumber, status: $status, qualification: $qualification, currentRole: $currentRole, remarks: $remarks, requirements: $requirements)';
  }
}
