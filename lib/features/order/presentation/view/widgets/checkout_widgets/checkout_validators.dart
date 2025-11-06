class CheckoutValidators {
  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required *';
    }
    if (value.trim().length < 3) {
      return 'Name must be at least 3 characters';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone is required *';
    }
    final phoneRegex = RegExp(r'^01[0-2,5]{1}[0-9]{8}$');
    if (!phoneRegex.hasMatch(value.trim())) {
      return 'Please enter a valid Egyptian phone number';
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required *'; // الآن إجباري
    }
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value.trim())) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Address is required *';
    }
    if (value.trim().length < 10) {
      return 'Please enter a detailed address';
    }
    return null;
  }
}