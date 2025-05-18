import 'package:varkkeys_app/src/data/models/contact/contact.dart';

abstract class ContactRepo {
  Future<List<Contact>> getContacts();
  Future<Contact> updateContact(String phone, Map<String, dynamic> updatedData);
}

