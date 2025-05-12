import 'package:hive/hive.dart';

part 'contact.g.dart';

@HiveType(typeId: 0)
class Contact extends HiveObject {
  @HiveField(0)
  String contactNumber;

  @HiveField(1)
  String name;

  @HiveField(2)
  String qualification;

  @HiveField(3)
  String currentRole;

  @HiveField(4)
  String status;

  @HiveField(5)
  String remarks;

  @HiveField(6)
  String requirements;

  // ✅ Constructor to initialize all fields
  Contact({
    required this.contactNumber,
    required this.name,
    required this.qualification,
    required this.currentRole,
    required this.status,
    required this.remarks,
    required this.requirements,
  });
}
