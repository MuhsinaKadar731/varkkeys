import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:varkkeys/data/models/contact.dart';

class ContactController extends GetxController {
  // Initial contact list (map form)
  RxList<Map<String, String>> initialContacts =
      [
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
        }, // no name
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
          "contactNumber": "1111111111",
          "name": "Unknown",
          "qualification": "Unknown",
          "currentRole": 'Unknown',
          "status": "Unknown",
          "remarks": "Unknown",
          "requirements": "Unknown",
        }, // no name
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
          "contactNumber": "1111155111",
          "name": "Unknown",
          "qualification": "Unknown",
          "currentRole": 'Sales Executive',
          "status":
              "sdjhgagsfh fmdhgfjhge fjwehgfjhgwehgf ewfhewghjfghewgf jhegfhghegfjhgef jewhgfhgehf ewfhewgfhgewhfghwg",
          "remarks":
              "ashgdjhags fasmhgfjgsa fmhgsfhb qefjhgqeb fjehwgfjhgewhgfjhe fghewgjfhjer gfmewhgfewbfg ewjgjyewhgfw",
          "requirements":
              "snbdkjagskf asmfgkas famhsgf asfmhgasd fjadhf a gfkegaf enmgfkhegfkhge femjgqfkgefg ejfgjegfegf",
        },
        {
          "contactNumber": "1111155333",
          "name": "Unknown",
          "qualification": "Plustwo",
          "currentRole": 'Unknown',
          "status": "Interested",
          "remarks":
              "jdasfkbda amsnbfkadbf sanmfhjkads fanmsdfbda fmnadgfj fmngadjf  jkasfgjkagds fasmgfkjas asjhfkhgs",
          "requirements": "Unknown",
        },
      ].obs;

  // Observable list of saved contacts
  RxList<Contact> contactNumbers = <Contact>[].obs;

  // Hive box for contacts
  late Box<Contact> contactBox;
  RxBool showPhoneNumberDetails = true.obs;
  RxString name = ''.obs;
  RxString phoneNumber = ''.obs;
  RxString qualification = ''.obs;
  RxString currentRole = ''.obs;
  RxString remarks = ''.obs;
  RxString requirements = ''.obs;
  RxString status = ''.obs;
  RxString phoneValidationMessage = "Invalid Phone Number".obs;

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final qualificationController = TextEditingController();
  final roleController = TextEditingController();
  final remarksController = TextEditingController();
  final requirementsController = TextEditingController();
  final statusController = TextEditingController();

  var isEditingPhone = false.obs;
  RxString userName = "".obs;
  RxBool isProfileCompleted = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await openContactBox(); // ✅ Wait until box is opened
    loadContacts(); // ✅ Then safely load contacts
  }

  // Open Hive box and load contacts
  Future<void> openContactBox() async {
    log("inside openContactBox()");
    contactBox = await Hive.openBox<Contact>('contacts');

    // Only seed data if the box is empty
    if (contactBox.isEmpty) {
      for (var contactMap in initialContacts) {
        final number = contactMap['contactNumber'] ?? '';
        if (number.isNotEmpty) {
          final contact = Contact(
            contactNumber: number,
            name:
                contactMap['name']?.trim().isNotEmpty == true
                    ? contactMap['name']!
                    : 'Unknown',
            qualification:
                contactMap['qualification']?.trim().isNotEmpty == true
                    ? contactMap['qualification']!
                    : 'Unknown',
            currentRole:
                contactMap['currentRole']?.trim().isNotEmpty == true
                    ? contactMap['currentRole']!
                    : 'Unknown',
            status:
                contactMap['status']?.trim().isNotEmpty == true
                    ? contactMap['status']!
                    : 'Unknown',
            remarks:
                contactMap['remarks']?.trim().isNotEmpty == true
                    ? contactMap['remarks']!
                    : 'None',
            requirements:
                contactMap['requirements']?.trim().isNotEmpty == true
                    ? contactMap['requirements']!
                    : 'None',
          );
          await contactBox.add(contact);
          contactMap['name']?.trim().isNotEmpty == true
              ? name.value = contactMap['name']!
              : name.value = 'Unknown';
        }
      }
    }

    loadContacts();
  }

  // Load contacts into observable list
  void loadContacts() {
    if (contactBox.isOpen) {
      contactNumbers.value = contactBox.values.toList();
      for (Contact contact in contactNumbers) {
        log(contact.toString());
      }
    } else {
      log("Contact box is not open");
    }
  }

  // Add a new contact to Hive
  Future<void> addContact(Contact contact) async {
    await contactBox.add(contact);
    loadContacts();
  }

  // Update an existing contact
  void updateContact(int index, Contact contact) {
    contactBox.putAt(index, contact);
    loadContacts();
  }

  // Delete a contact
  void deleteContact(int index) {
    contactBox.deleteAt(index);
    loadContacts();
  }

  // Validate phone number dynamically
  String? validatePhoneNumber() {
    String phone = phoneController.text;

    if (phone.isNotEmpty) {
      if (phone.length < 10) {
        phoneValidationMessage.value = "Phone number should be 10 digits long";
        return "Phone number should be 10 digits long";
      } else if (phone.length > 10) {
        phoneValidationMessage.value = "Phone number cannot exceed 10 digits";
        return "Phone number cannot exceed 10 digits";
      }
    }
    phoneValidationMessage.value = ""; // Clear validation message
    return null; // Valid phone number
  }

  /// Called when user clicks Save
  void setProfileDetails(String number) {
    final phoneValidationMessage = validatePhoneNumber();
    if (phoneValidationMessage != null) {
      Get.snackbar(
        'Validation Error',
        phoneValidationMessage,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
      );
      return; // Stop the saving process
    }

    name.value = nameController.text;
    phoneNumber.value = phoneController.text;
    qualification.value = qualificationController.text;
    currentRole.value = roleController.text;
    remarks.value = remarksController.text;
    requirements.value = requirementsController.text;
    status.value = statusController.text;
    userName.value = name.value;

    final index = contactNumbers.indexWhere(
      (contact) => contact.contactNumber == number,
    );
    if (index != -1) {
      Contact updatedContact = Contact(
        contactNumber: number,
        name: name.value,
        status: status.value,
        qualification: qualification.value,
        currentRole: currentRole.value,
        remarks: remarks.value,
        requirements: requirements.value,
      );

      updateContact(index, updatedContact);
      contactNumbers.refresh();
    }

    Get.back();
  }

  void clearProfileFields() {
    nameController.clear();
    phoneController.clear();
    qualificationController.clear();
    roleController.clear();
    remarksController.clear();
    requirementsController.clear();
    statusController.clear();
  }

  void loadContactDetails(String number) {
    final contact = contactNumbers.firstWhere(
      (c) => c.contactNumber == number,
      orElse:
          () => Contact(
            contactNumber: '',
            name: '',
            status: '',
            qualification: '',
            currentRole: '',
            remarks: '',
            requirements: '',
          ),
    );

    name.value = contact.name ?? '';
    phoneNumber.value = contact.contactNumber;
    qualification.value = contact.qualification ?? '';
    currentRole.value = contact.currentRole ?? '';
    remarks.value = contact.remarks ?? '';
    requirements.value = contact.requirements ?? '';
    status.value = contact.status ?? '';

    // Update controllers too (optional, for editing)
    nameController.text = name.value;
    phoneController.text = phoneNumber.value;
    qualificationController.text = qualification.value;
    roleController.text = currentRole.value;
    remarksController.text = remarks.value;
    requirementsController.text = requirements.value;
    statusController.text = status.value;
    userName.value = nameController.text;
  }

  void completeProfile() {
    log("Inside Complete Profile");
    final number = phoneNumber.value;

    final index = contactNumbers.indexWhere(
      (contact) => contact.contactNumber == number,
    );

    if (index != -1) {
      final contact = contactNumbers[index];

      // Update the fields
      contact.name = nameController.text;
      contact.qualification = qualificationController.text;
      contact.currentRole = roleController.text;
      contact.remarks = remarksController.text;
      contact.requirements = requirementsController.text;
      contact.status = statusController.text;

      // Save updated contact in Hive
      contactBox.putAt(index, contact);
      loadContacts();

      log("Contact updated and saved in Hive.");
    } else {
      log("Contact not found for number: $number");
    }

    isProfileCompleted.value = true;
  }
}
