import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
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
      'https://varkkyslearning.pythonanywhere.com//api/candidate/$phone/',
    );

    final request = http.MultipartRequest('PATCH', url)
      ..headers['Authorization'] = 'Token $token';

    // Add fields
    request.fields['phone'] = updatedData['phone'] ?? '';
    request.fields['first_name'] = updatedData['first_name'] ?? '';
    request.fields['last_name'] = updatedData['last_name'] ?? '';
    request.fields['email'] = updatedData['email'] ?? '';
    request.fields['address'] = updatedData['address'] ?? '';
    request.fields['age'] = (updatedData['age'] ?? 0).toString();
    request.fields['qualification'] = updatedData['qualification'] ?? '';
    request.fields['interested_area'] = updatedData['interested_area'] ?? '';
    request.fields['current_role'] = updatedData['current_role'] ?? '';
    request.fields['status'] = updatedData['status'] ?? '';
    request.fields['remarks'] = updatedData['remarks'] ?? '';
    request.fields['requirements_of_candidate'] =
        updatedData['requirements_of_candidate'] ?? '';
    request.fields['assigned_to'] = updatedData['assigned_to'] ?? '';
    request.fields['lead_type'] = updatedData['lead_type'] ?? '';

    // Add audio file if provided
    final audioPath = updatedData['audio_record'];
    if (audioPath != null && audioPath.toString().isNotEmpty) {
      final audioFile = File(audioPath);
      if (await audioFile.exists()) {
        request.files.add(
          await http.MultipartFile.fromPath(
            'audio_record',
            audioFile.path,
            contentType: MediaType('audio', 'mpeg'), // adjust if not mp3
          ),
        );
      }
    }

    // Send request
    final streamedResponse = await request.send();
    final responseBody = await streamedResponse.stream.bytesToString();

    log("Update Response in impl => $responseBody");

    if (streamedResponse.statusCode == 200) {
      final responseData = jsonDecode(responseBody);
      return Contact.fromJson(responseData);
    } else {
      throw Exception('Failed to update contact: $responseBody');
    }
  }
}
