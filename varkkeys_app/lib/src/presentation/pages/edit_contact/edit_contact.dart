import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:varkkeys_app/src/core/theme/colors.dart';
import 'package:varkkeys_app/src/data/models/contact/contact.dart';
import 'package:varkkeys_app/src/data/repositories/contact_repo_impl/contact_repo_impl.dart';
import 'package:varkkeys_app/src/domain/repositories/contact_repo/contact_repo.dart';
import 'package:varkkeys_app/src/presentation/controllers/contact_controller.dart';
import 'package:varkkeys_app/src/presentation/pages/contact_info/contact_info.dart';
import 'package:varkkeys_app/src/widgets/app_btn.dart';

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
  late TextEditingController _remarksController;
  late TextEditingController _requirementsController;
  ContactRepo contactRepo = ContactRepoImpl();
  ContactController contactController = Get.find<ContactController>();

  @override
  void initState() {
    super.initState();
    _firstNameController = TextEditingController(
      text: widget.contact.first_name,
    );
    _lastNameController = TextEditingController(text: widget.contact.last_name);
    _phoneController = TextEditingController(text: widget.contact.phone);
    _emailController = TextEditingController(text: widget.contact.email);
    _addressController = TextEditingController(text: widget.contact.address);
    _ageController = TextEditingController(text: widget.contact.age.toString());
    _qualificationController = TextEditingController(
      text: widget.contact.qualification,
    );
    _interestedAreaController = TextEditingController(
      text: widget.contact.interested_area,
    );
    _currentRoleController = TextEditingController(
      text: widget.contact.current_role,
    );
    _statusController = TextEditingController(text: widget.contact.status);
    _remarksController = TextEditingController(text: widget.contact.remarks);
    _requirementsController = TextEditingController(
      text: widget.contact.requirements_of_candidate,
    );
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
    _remarksController.dispose();
    _requirementsController.dispose();
    super.dispose();
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
        "remarks": _remarksController.text,
        "requirements_of_candidate": _requirementsController.text,
        "assigned_to":
            widget.contact.assigned_to ?? "", // keep existing if not editable
      };

      log("Updated Details => $updatedContact");
      contactController.selectedContact.value?.first_name =
          _firstNameController.text;
      contactController.selectedContact.value?.last_name =
          _lastNameController.text;
      contactController.selectedContact.value?.phone = _phoneController.text;
      contactController.selectedContact.value?.email = _emailController.text;
      contactController.selectedContact.value?.address =
          _addressController.text;
      contactController.selectedContact.value?.age =
          int.tryParse(_ageController.text) ?? 0;
      contactController.selectedContact.value?.qualification =
          _qualificationController.text;
      contactController.selectedContact.value?.interested_area =
          _interestedAreaController.text;
      contactController.selectedContact.value?.current_role =
          _currentRoleController.text;
      contactController.selectedContact.value?.status = _statusController.text;
      contactController.selectedContact.value?.remarks =
          _remarksController.text;
      contactController.selectedContact.value?.requirements_of_candidate =
          _requirementsController.text;

      try {
        await contactRepo.updateContact(_phoneController.text, updatedContact);
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Contact updated successfully')));
        Get.to(ContactInfo());
      } catch (e) {
        log(e.toString());
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Failed to update contact: $e')));
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
              TextFormField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'First Name',
                  labelStyle: GoogleFonts.urbanist(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                style: GoogleFonts.urbanist(color: AppColors.blackColor),

                validator:
                    (value) =>
                        value?.isEmpty ?? true
                            ? 'Please enter first name'
                            : null,
              ),
              TextFormField(
                controller: _lastNameController,
                style: GoogleFonts.urbanist(color: AppColors.blackColor),

                decoration: InputDecoration(
                  labelText: 'Last Name',

                  labelStyle: GoogleFonts.urbanist(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                validator:
                    (value) =>
                        value?.isEmpty ?? true
                            ? 'Please enter last name'
                            : null,
              ),
              TextFormField(
                controller: _phoneController,
                style: GoogleFonts.urbanist(color: AppColors.blackColor),

                decoration: InputDecoration(
                  labelText: 'Phone',
                  labelStyle: GoogleFonts.urbanist(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                validator:
                    (value) =>
                        value?.isEmpty ?? true
                            ? 'Please enter phone number'
                            : null,
              ),
              TextFormField(
                controller: _emailController,
                style: GoogleFonts.urbanist(color: AppColors.blackColor),

                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: GoogleFonts.urbanist(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                validator:
                    (value) =>
                        value?.isEmpty ?? true ? 'Please enter email' : null,
              ),
              TextFormField(
                controller: _addressController,
                style: GoogleFonts.urbanist(color: AppColors.blackColor),

                decoration: InputDecoration(
                  labelText: 'Address',
                  labelStyle: GoogleFonts.urbanist(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                validator:
                    (value) =>
                        value?.isEmpty ?? true ? 'Please enter address' : null,
              ),
              TextFormField(
                controller: _ageController,
                style: GoogleFonts.urbanist(color: AppColors.blackColor),

                decoration: InputDecoration(
                  labelText: 'Age',
                  labelStyle: GoogleFonts.urbanist(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                keyboardType: TextInputType.number,
                validator:
                    (value) =>
                        value?.isEmpty ?? true ? 'Please enter age' : null,
              ),
              TextFormField(
                controller: _qualificationController,
                style: GoogleFonts.urbanist(color: AppColors.blackColor),

                decoration: InputDecoration(
                  labelText: 'Qualification',
                  labelStyle: GoogleFonts.urbanist(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                validator:
                    (value) =>
                        value?.isEmpty ?? true
                            ? 'Please enter qualification'
                            : null,
              ),
              TextFormField(
                controller: _interestedAreaController,
                style: GoogleFonts.urbanist(color: AppColors.blackColor),

                decoration: InputDecoration(
                  labelText: 'Interested Area',
                  labelStyle: GoogleFonts.urbanist(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                validator:
                    (value) =>
                        value?.isEmpty ?? true
                            ? 'Please enter interested area'
                            : null,
              ),
              TextFormField(
                controller: _currentRoleController,
                style: GoogleFonts.urbanist(color: AppColors.blackColor),

                decoration: InputDecoration(
                  labelText: 'Current Role',
                  labelStyle: GoogleFonts.urbanist(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                validator:
                    (value) =>
                        value?.isEmpty ?? true
                            ? 'Please enter current role'
                            : null,
              ),
              TextFormField(
                controller: _statusController,
                style: GoogleFonts.urbanist(color: AppColors.blackColor),

                decoration: InputDecoration(
                  labelText: 'Status',
                  labelStyle: GoogleFonts.urbanist(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                validator:
                    (value) =>
                        value?.isEmpty ?? true ? 'Please enter status' : null,
              ),
              TextFormField(
                controller: _remarksController,
                style: GoogleFonts.urbanist(color: AppColors.blackColor),

                decoration: InputDecoration(
                  labelText: 'Remarks',
                  labelStyle: GoogleFonts.urbanist(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                validator:
                    (value) =>
                        value?.isEmpty ?? true ? 'Please enter remarks' : null,
              ),
              TextFormField(
                controller: _requirementsController,
                style: GoogleFonts.urbanist(color: AppColors.blackColor),

                decoration: InputDecoration(
                  labelText: 'Requirements',
                  labelStyle: GoogleFonts.urbanist(
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                validator:
                    (value) =>
                        value?.isEmpty ?? true
                            ? 'Please enter requirements'
                            : null,
              ),
              SizedBox(height: 20),
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
              // ElevatedButton(onPressed: _saveForm, child: Text('Save Changes')),
            ],
          ),
        ),
      ),
    );
  }
}
