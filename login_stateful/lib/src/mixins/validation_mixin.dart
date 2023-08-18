class ValidationMixin {
  String? validateEmail(value) {
    if (value != null && !value.contains('@')) {
      return 'Please Enter a Valid Email';
    }
    return null;
  }

  String? validatePassword(value) {
    if (value != null && value.length < 4) {
      return 'Password must be atleast 4 characters!';
    }
    return null;
  }
}