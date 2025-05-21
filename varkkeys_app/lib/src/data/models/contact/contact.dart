class Contact {
  String first_name;
  String last_name;
  String phone;
  String email;
  String address;
  int age;
  String qualification;
  String interested_area;
  String current_role;
  String status;
  String remarks;
  String requirements_of_candidate;
  String assigned_to;
  String audio_record;
  String lead_type;

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
    required this.audio_record,
    required this.lead_type,
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
      assigned_to: json['assigned_to'] ?? '',
      audio_record: json['audio_record'] ?? '',
      lead_type: json['lead_type'] ?? '',
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
      'assigned_to': assigned_to,
      'audio_record': audio_record,
      'lead_type': lead_type,
    };
  }

  @override
  String toString() {
    return 'Contact('
        'first_name: $first_name, '
        'last_name: $last_name, '
        'phone: $phone, '
        'email: $email, '
        'address: $address, '
        'age: $age, '
        'qualification: $qualification, '
        'interested_area: $interested_area, '
        'current_role: $current_role, '
        'status: $status, '
        'remarks: $remarks, '
        'requirements_of_candidate: $requirements_of_candidate, '
        'assigned_to: $assigned_to, '
        'audio_record: $audio_record, '
        'lead_type: $lead_type'
        ')';
  }
}
