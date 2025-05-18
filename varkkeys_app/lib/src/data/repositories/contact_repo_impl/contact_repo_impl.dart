import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:varkkeys_app/src/data/models/contact/contact.dart';
import '../../../domain/repositories/contact_repo/contact_repo.dart';

class ContactRepoImpl implements ContactRepo {
  final String baseUrl = 'https://varkkyslearning.pythonanywhere.com/api';

  @override
  Future<List<Contact>> getContacts() async {
    log("inside getContacts()");

    try {
      // Fetch token from SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('auth_token');
      log("Token in contact page => $token");

      if (token == null || token.isEmpty) {
        throw Exception('No auth token found');
      }

      final url = Uri.parse('$baseUrl/candidates/');
      log("url => $url");
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Token $token',
          'Content-Type': 'application/json',
        },
      );

      // log("response => ${response.body}");

      if (response.statusCode == 200) {
        // log("Candidates fetched successfully");
        final List<dynamic> data = jsonDecode(response.body);
        return data.map<Contact>((json) => Contact.fromJson(json)).toList();
      } else {
        log("Failed to fetch contacts: ${response.statusCode}");
        throw Exception('Failed to load contacts');
      }
    } catch (e) {
      log('Error in getContacts(): $e');
      throw Exception('Failed to fetch contacts');
    }
  }

  Future<Contact> updateContact(
    String phone,
    Map<String, dynamic> updatedData,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    if (token == null || token.isEmpty) {
      throw Exception('No auth token found');
    }

    final url = Uri.parse(
      // 'https://varkkyslearning.pythonanywhere.com/api/candidate/update/$phone/',
      'https://varkkyslearning.pythonanywhere.com//api/candidate/$phone/',
    );

    final bodyData = jsonEncode({
      "phone": updatedData["phone"] ?? "",
      "first_name": updatedData["first_name"] ?? "",
      "last_name": updatedData["last_name"] ?? "",
      "email": updatedData["email"] ?? "",
      "address": updatedData["address"] ?? "",
      "age": updatedData["age"] ?? 0,
      "qualification": updatedData["qualification"] ?? "",
      "interested_area": updatedData["interested_area"] ?? "",
      "current_role": updatedData["current_role"] ?? "",
      "status": updatedData["status"] ?? "",
      "remarks": updatedData["remarks"] ?? "",
      "requirements_of_candidate":
          updatedData["requirements_of_candidate"] ?? "",
      "assigned_to": updatedData["assigned_to"] ?? "",
    });

    final response = await http.patch(
      url,
      headers: {
        'Authorization': 'Token $token',
        'Content-Type': 'application/json',
      },
      body: bodyData,
    );

    // log("Update Response => ${response.body}");

    if (response.statusCode == 200) {
      log("Contact updated successfully");
      final responseData = jsonDecode(response.body);
      return Contact.fromJson(responseData);
    } else {
      throw Exception('Failed to update contact: ${response.body}');
    }
  }
}
