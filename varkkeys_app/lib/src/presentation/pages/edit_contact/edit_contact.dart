import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:varkkeys_app/src/core/theme/colors.dart';
import 'package:varkkeys_app/src/data/models/contact/contact.dart';
import 'package:varkkeys_app/src/data/repositories/contact_repo_impl/contact_repo_impl.dart';
import 'package:varkkeys_app/src/domain/repositories/contact_repo/contact_repo.dart';
import 'package:varkkeys_app/src/presentation/pages/contact_info/contact_info.dart';
import 'package:varkkeys_app/src/widgets/app_btn.dart';

import '../../controllers/contact_controller.dart';

class EditContact extends StatefulWidget {
  final Contact contact;

  EditContact({Key? key, required this.contact}) : super(key: key);

  @override
  _EditContactState createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  final _formKey = GlobalKey<FormState>();

  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _phoneController;
  late TextEditingController _emailController;
  late TextEditingController _addressController;
  late TextEditingController _ageController;
  late TextEditingController _qualificationController;
  late TextEditingController _interestedAreaController;
  late TextEditingController _currentRoleController;
  late TextEditingController _statusController;
  late TextEditingController _leadTypeController;
  late TextEditingController _remarksController;
  late TextEditingController _requirementsController;
  String? _audioFilePath;

  ContactRepo contactRepo = ContactRepoImpl();
  ContactController contactController = Get.find<ContactController>();

  final List<Map<String, String>> statusOptions = [
    {'value': 'interested', 'label': 'Interested'},
    {'value': 'not-interested', 'label': 'Not-interested'},
    {'value': 'followup', 'label': 'Followup'},
    {'value': 'rejected', 'label': 'Rejected'},
  ];

  final List<Map<String, String>> leadType = [
    {'value': 'inbound_lead', 'label': 'Inbound Lead'},
    {'value': 'outbound_lead', 'label': 'Outbound Lead'},
  ];

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(text: widget.contact.first_name);
    _lastNameController = TextEditingController(text: widget.contact.last_name);
    _phoneController = TextEditingController(text: widget.contact.phone);
    _emailController = TextEditingController(text: widget.contact.email);
    _addressController = TextEditingController(text: widget.contact.address);
    _ageController = TextEditingController(text: widget.contact.age.toString());
    _qualificationController = TextEditingController(text: widget.contact.qualification);
    _interestedAreaController = TextEditingController(text: widget.contact.interested_area);
    _currentRoleController = TextEditingController(text: widget.contact.current_role);
    _statusController = TextEditingController(text: widget.contact.status);
    _leadTypeController = TextEditingController(text: widget.contact.lead_type);
    _remarksController = TextEditingController(text: widget.contact.remarks);
    _requirementsController = TextEditingController(text: widget.contact.requirements_of_candidate);
    _audioFilePath = widget.contact.audio_record;
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _ageController.dispose();
    _qualificationController.dispose();
    _interestedAreaController.dispose();
    _currentRoleController.dispose();
    _statusController.dispose();
    _leadTypeController.dispose();
    _remarksController.dispose();
    _requirementsController.dispose();
    super.dispose();
  }

  Future<void> _pickAudioFile() async {
    final result = await FilePicker.platform.pickFiles(type: FileType.audio);
    if (result != null && result.files.single.path != null) {
      setState(() {
        _audioFilePath = result.files.single.path!;
      });
    }
  }

  void _saveForm() async {
    if (_formKey.currentState?.validate() ?? false) {
      final updatedContact = {
        "first_name": _firstNameController.text,
        "last_name": _lastNameController.text,
        "phone": _phoneController.text,
        "email": _emailController.text,
        "address": _addressController.text,
        "age": int.tryParse(_ageController.text) ?? 0,
        "qualification": _qualificationController.text,
        "interested_area": _interestedAreaController.text,
        "current_role": _currentRoleController.text,
        "status": _statusController.text,
        "lead_type": _leadTypeController.text,
        "remarks": _remarksController.text,
        "requirements_of_candidate": _requirementsController.text,
        "assigned_to": widget.contact.assigned_to ?? "",
        "audio_record": _audioFilePath ?? "",
      };

      log("Updated Details => $updatedContact");

      contactController.selectedContact.value?.first_name = _firstNameController.text;
      contactController.selectedContact.value?.last_name = _lastNameController.text;
      contactController.selectedContact.value?.phone = _phoneController.text;
      contactController.selectedContact.value?.email = _emailController.text;
      contactController.selectedContact.value?.address = _addressController.text;
      contactController.selectedContact.value?.age = int.tryParse(_ageController.text) ?? 0;
      contactController.selectedContact.value?.qualification = _qualificationController.text;
      contactController.selectedContact.value?.interested_area = _interestedAreaController.text;
      contactController.selectedContact.value?.current_role = _currentRoleController.text;
      contactController.selectedContact.value?.status = _statusController.text;
      contactController.selectedContact.value?.lead_type = _leadTypeController.text;
      contactController.selectedContact.value?.remarks = _remarksController.text;
      contactController.selectedContact.value?.requirements_of_candidate = _requirementsController.text;
      contactController.selectedContact.value?.audio_record = _audioFilePath ?? "";
      contactController.selectedContact.value?.lead_type = _leadTypeController.text ?? "";

      try {
        await contactController.updateContactOnline(
          Contact(
            first_name: _firstNameController.text,
            last_name: _lastNameController.text,
            phone: _phoneController.text,
            email: _emailController.text,
            address: _addressController.text,
            age: int.tryParse(_ageController.text) ?? 0,
            qualification: _qualificationController.text,
            interested_area: _interestedAreaController.text,
            current_role: _currentRoleController.text,
            status: _statusController.text,
            lead_type: _leadTypeController.text,
            remarks: _remarksController.text,
            requirements_of_candidate: _requirementsController.text,
            assigned_to: widget.contact.assigned_to ?? '',
            audio_record: _audioFilePath ?? '',
          ),
        );

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Contact updated successfully',
              style: GoogleFonts.urbanist(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            backgroundColor: Colors.red[500],
          ),
        );
        Get.to(ContactInfo());
      } catch (e) {
        log(e.toString());
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update contact: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          'Edit Contact',
          style: GoogleFonts.raleway(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: AppColors.primaryColor,
          ),
        ),
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildTextField(_firstNameController, 'First Name'),
              buildTextField(_lastNameController, 'Last Name'),
              buildTextField(_phoneController, 'Phone'),
              buildTextField(_emailController, 'Email'),
              buildTextField(_addressController, 'Address'),
              buildTextField(_ageController, 'Age', isNumber: true),
              buildTextField(_qualificationController, 'Qualification'),
              buildTextField(_interestedAreaController, 'Interested Area'),
              buildTextField(_currentRoleController, 'Current Role'),

              DropdownButtonFormField<String>(
                value: statusOptions.any((option) => option['value'] == _statusController.text)
                    ? _statusController.text
                    : null,
                decoration: InputDecoration(
                  labelText: 'Status',
                  labelStyle: GoogleFonts.urbanist(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                items: statusOptions.map((status) {
                  return DropdownMenuItem<String>(
                    value: status['value'],
                    child: Text(status['label']!),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _statusController.text = value ?? '';
                  });
                },
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please select a status' : null,
              ),

              DropdownButtonFormField<String>(
                value: leadType.any((option) => option['value'] == _leadTypeController.text)
                    ? _leadTypeController.text
                    : null,
                decoration: InputDecoration(
                  labelText: 'Lead Type',
                  labelStyle: GoogleFonts.urbanist(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                items: leadType.map((type) {
                  return DropdownMenuItem<String>(
                    value: type['value'],
                    child: Text(type['label']!),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _leadTypeController.text = value ?? '';
                  });
                },
                validator: (value) =>
                    value == null || value.isEmpty ? 'Please select a lead type' : null,
              ),

              buildTextField(_remarksController, 'Remarks'),
              buildTextField(_requirementsController, 'Requirements'),

              const SizedBox(height: 20),
              Text(
                _audioFilePath != null
                    ? 'Selected Audio: ${_audioFilePath!.split('/').last}'
                    : 'No audio selected',
                style: GoogleFonts.urbanist(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              TextButton.icon(
                onPressed: _pickAudioFile,
                icon: const Icon(Icons.audiotrack, color: AppColors.blackColor),
                label: Text(
                  'Click to Upload Call Record',
                  style: GoogleFonts.urbanist(
                    color: AppColors.primaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              AppBtn(
                onTap: _saveForm,
                child: Text(
                  'Save Changes',
                  style: GoogleFonts.raleway(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(TextEditingController controller, String label, {bool isNumber = false}) {
    return TextFormField(
      controller: controller,
      style: GoogleFonts.urbanist(color: AppColors.blackColor),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: GoogleFonts.urbanist(
          color: AppColors.blackColor,
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
      keyboardType: isNumber ? TextInputType.number : TextInputType.text,
      validator: (value) => value?.isEmpty ?? true ? 'Please enter $label' : null,
    );
  }
}
