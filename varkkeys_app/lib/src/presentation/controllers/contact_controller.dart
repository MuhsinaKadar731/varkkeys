import 'dart:developer';

import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:varkkeys_app/src/data/models/contact.dart';

class ContactController extends GetxController {
  // This will be used to show and update data in the UI
  RxList<Contact> contacts = <Contact>[].obs;
  RxBool isPhoneValid = false.obs;

  @override
  void onInit() {
    super.onInit();
    _initializeContacts();
  }

  /// Step 1: Initialize contacts in Hive if empty
  Future<void> _initializeContacts() async {
    final contactBox = await Hive.openBox<Contact>('contacts');

    // Only populate initial contacts if the box is empty
    if (contactBox.isEmpty) {
      final List<Map<String, String>> initialContacts = [
        {
          "contactNumber": "1234567890",
          "name": "Alice",
          "qualification": "BTECH",
          "currentRole": 'Software Developer',
          "status": "Interested",
          "remarks": "Next call on 27/04/2025",
          'requirements': 'For interview purposes',
        },
        {
          "contactNumber": "9876543210",
          "name": "Unknown",
          "qualification": "BCA",
          "currentRole": 'Programmer',
          "status": "Unknown",
          "remarks": "Unknown",
          "requirements": "Unknown",
        },
        {
          "contactNumber": "5555555555",
          "name": "Charlie",
          "qualification": "Unknown",
          "currentRole": 'Driver',
          "status": "Unknown",
          "remarks": "Unknown",
          "requirements": "Unknown",
        },
        {
          "contactNumber": "5755757575",
          "name": "Unknown",
          "qualification": "Unknown",
          "currentRole": 'Unknown',
          "status": "Unknown",
          "remarks": "Unknown",
          "requirements": "Unknown",
        },
        {
          "contactNumber": "1111155111",
          "name": "Rithu",
          "qualification": "MBBS",
          "currentRole": 'Doctor',
          "status": "Interested",
          "remarks": "Unknown",
          "requirements": "Unknown",
        },
        {
          "contactNumber": "1111155112",
          "name": "Unknown",
          "qualification": "Unknown",
          "currentRole": 'Sales Executive',
          "status": "Very long status here",
          "remarks": "Very long remarks here",
          "requirements": "Very long requirements here",
        },
        {
          "contactNumber": "1111155334",
          "name": "Unknown",
          "qualification": "Plustwo",
          "currentRole": 'Unknown',
          "status": "Interested",
          "remarks": "Detailed remarks",
          "requirements": "Unknown",
        },
      ];

      for (var data in initialContacts) {
        final contact = Contact(
          contactNumber: data['contactNumber']!,
          name: data['name']!,
          qualification: data['qualification']!,
          currentRole: data['currentRole']!,
          status: data['status']!,
          remarks: data['remarks']!,
          requirements: data['requirements']!,
        );
        await contactBox.add(contact);
      }

      log('Initial contacts added to Hive.');
    }

    // Load contacts from Hive into observable list
    loadContactsFromHive();
  }

  /// Step 2: Load contacts from Hive into observable list
  Future<void> loadContactsFromHive() async {
    final contactBox = await Hive.openBox<Contact>('contacts');
    contacts.value = contactBox.values.toList();
    log('Contacts loaded from Hive.');
  }

  void updateField(int index, String field, String newValue) {
    final contact = contacts[index];

    switch (field) {
      case 'name':
        contact.name = newValue;
        break;
      case 'contactNumber':
        contact.contactNumber = newValue;
        break;
      case 'qualification':
        contact.qualification = newValue;
        break;
      case 'currentRole':
        contact.currentRole = newValue;
        break;
      case 'status':
        contact.status = newValue;
        break;
      case 'remarks':
        contact.remarks = newValue;
        break;
      case 'requirements':
        contact.requirements = newValue;
        break;
      default:
        log('Invalid field: $field');
        return;
    }

    contact.save(); // Save to Hive
    contacts[index] = contact; // Update observable list for UI

    // Notify listeners that the data has changed
    update(); // This will notify UI and trigger a rebuild of the ContactInfo page
    log('Contact updated: $field -> $newValue');
  }

  bool isValidPhoneNumber(String phone) {
    final regex = RegExp(r'^[0-9]{10}$');
    return regex.hasMatch(phone);
  }
}
