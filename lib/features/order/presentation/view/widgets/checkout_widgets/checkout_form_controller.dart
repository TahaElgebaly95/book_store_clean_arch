import 'package:flutter/material.dart';

import '../../../../data/model/ckechout_model.dart';
import '../../../../data/model/governorate_model.dart';

class CheckoutFormController {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController addressController;

  int selectedGovernorateId; // Changed to int (ID)
  String selectedPaymentMethod;

  CheckoutFormController({
    required UserData userData,
  })  : nameController = TextEditingController(text: userData.userName),
        phoneController = TextEditingController(text: userData.phone),
        emailController = TextEditingController(),
        addressController = TextEditingController(text: userData.address),
        selectedGovernorateId = GovernorateData.egyptGovernorates.first.id, // Use ID
        selectedPaymentMethod = 'cash';

  // Getters
  String get name => nameController.text.trim();
  String get phone => phoneController.text.trim();
  String get email => emailController.text.trim();
  String get address => addressController.text.trim();

  // Get governorate name for display
  String get selectedGovernorateName {
    final gov = GovernorateData.egyptGovernorates
        .firstWhere((g) => g.id == selectedGovernorateId);
    return gov.nameEn;
  }

  String get fullAddress => '$address, $selectedGovernorateName';

  // Validation
  bool get isValid {
    return name.isNotEmpty &&
        phone.isNotEmpty &&
        address.isNotEmpty &&
        selectedGovernorateId > 0;
  }

  String? get validationError {
    if (name.isEmpty) return 'Name is required';
    if (phone.isEmpty) return 'Phone is required';
    if (address.isEmpty) return 'Address is required';
    if (selectedGovernorateId <= 0) return 'Governorate is required';
    return null;
  }

  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'email': email,
      'address': fullAddress,
      'governorate_id': selectedGovernorateId, // Send ID not name
      'payment_method': selectedPaymentMethod,
    };
  }
}