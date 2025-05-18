import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:varkkeys_app/src/data/models/contact/contact.dart';
import 'package:varkkeys_app/src/data/repositories/contact_repo_impl/contact_repo_impl.dart';
import 'package:varkkeys_app/src/domain/repositories/contact_repo/contact_repo.dart';
import 'package:varkkeys_app/src/presentation/controllers/login_controller.dart';
import 'package:varkkeys_app/src/presentation/pages/contact_info/contact_info.dart';

class ContactController extends GetxController {
  final LoginController loginController = Get.find<LoginController>();
  final ContactRepo contactRepo = ContactRepoImpl();

  RxList<Contact> contacts = <Contact>[].obs;
  RxBool isPhoneValid = false.obs;
  RxList<Contact> apiContacts = <Contact>[].obs;
  Rx<Contact?> selectedContact = Rx<Contact?>(null);

  @override
  void onInit() {
    super.onInit();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      loginController.showLoading.value = false;
      log("showLoading.value => ${loginController.showLoading.value}");
    });
    fetchContacts();
  }

  Future<List<Contact>> fetchContacts() async {
    apiContacts.value = await contactRepo.getContacts();
    return apiContacts;
  }

  void onContactSelected(Contact contact) {
    selectedContact.value = contact;
    Get.to(() => const ContactInfo());
  }

  bool isValidPhoneNumber(String phone) {
    final cleaned = phone.replaceAll(' ', '');
    final regex = RegExp(r'^\d{11,}$'); // 11 or more digits
    return regex.hasMatch(cleaned);
  }
  
  Future<void> updateContactOnline(Contact updatedContact) async {
  try {
    final phone = updatedContact.phone;
    final updatedData = {
      "phone": updatedContact.phone,
      "first_name": updatedContact.first_name,
      "last_name": updatedContact.last_name,
      "email": updatedContact.email,
      "address": updatedContact.address,
      "age": updatedContact.age,
      "qualification": updatedContact.qualification,
      "interested_area": updatedContact.interested_area,
      "current_role": updatedContact.current_role,
      "status": updatedContact.status,
      "remarks": updatedContact.remarks,
      "requirements_of_candidate": updatedContact.requirements_of_candidate,
      "assigned_to": updatedContact.assigned_to,
    };

    // Await the updated contact from repo
    Contact contactFromApi = await contactRepo.updateContact(phone, updatedData);

    // Update selected contact
    selectedContact.value = contactFromApi;

    // Update the contact in the contacts list
    int index = contacts.indexWhere((c) => c.phone == phone);
    if (index != -1) {
      contacts[index] = contactFromApi;
    }

    // Trigger UI update
    contacts.refresh();
    selectedContact.refresh();

    log("Contact successfully updated and UI refreshed.");
  } catch (e) {
    log("Failed to update contact: $e");
    rethrow;
  }
}

  

  // Future<void> updateContactOnline(Contact updatedContact) async {
  //   try {
  //     final phone = updatedContact.phone;
  //     final updatedData = {
  //       "name": updatedContact.first_name,
  //       "contactNumber": updatedContact.phone,
  //       "qualification": updatedContact.qualification,
  //       "currentRole": updatedContact.current_role,
  //       "status": updatedContact.status,
  //       "remarks": updatedContact.remarks,
  //       "requirements": updatedContact.requirements_of_candidate,
  //     };

  //     await contactRepo.updateContact(phone, updatedData);

  //     // Update the selected contact locally
  //     selectedContact.value = updatedContact;

  //     // Update the contact in the list
  //     int index = contacts.indexWhere((c) => c.phone == phone);
  //     if (index != -1) {
  //       contacts[index] = updatedContact;
  //     }

  //     update();
  //     log("Contact successfully updated.");
  //     log("Updated contact in controller => ${selectedContact.value}");
  //   } catch (e) {
  //     log("Failed to update contact: $e");
  //     rethrow;
  //   }
  // }
}