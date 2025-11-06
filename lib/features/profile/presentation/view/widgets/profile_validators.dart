class ProfileValidators {
  static String? validateName(String? value) {
    if (value?.isEmpty ?? true) return 'Name is required';
    if (value!.length < 3) return 'Name must be at least 3 characters';
    return null;
  }

  static String? validateEmail(String? value) {
    if (value?.isEmpty ?? true) return 'Email is required';
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
      return 'Please enter a valid email';
    }
    return null;
  }

  static String? validatePhone(String? value) {
    if (value?.isEmpty ?? true) return 'Phone is required';
    if (!RegExp(r'^01[0-2,5]{1}[0-9]{8}$').hasMatch(value!)) {
      return 'Please enter a valid Egyptian phone number';
    }
    return null;
  }

  static String? validateCity(String? value) {
    if (value?.isEmpty ?? true) return 'City is required';
    return null;
  }

  static String? validateAddress(String? value) {
    if (value?.isEmpty ?? true) return 'Address is required';
    if (value!.length < 10) return 'Please enter a detailed address (minimum 10 characters)';
    return null;
  }

  static String? validatePassword(String? value) {
    if ((value ?? '').isEmpty) {
      return 'Enter your password';
    } else if (!RegExp(r'[A-Z]').hasMatch(value!)) {
      return 'Password should has at least one uppercase letter';
    } else if (!RegExp(r'[!@#\\$%^&*(),.?":{}|<>]')
        .hasMatch(value)) {
      return 'Password should has special character';
    } else if (!RegExp(r'[1-9]').hasMatch(value)) {
      return 'password should has one number at least';
    } else if ((value.length ) < 8) {
      return 'Password can\'t be less than 8 Characters';
    }
    return null;
  }
}