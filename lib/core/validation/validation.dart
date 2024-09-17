class ValidationForm {
  static String? userNameValidator(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please Enter your name';
    }
    return null;
  }

  static String? nationalId(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please Enter your ID';
    } else if (value!.length != 14) {
      return 'ID is Failuer';
    }
    return null;
  }

  static String? phoneValidator(String? value) {
    //validation for egypt phone
    bool isValid =
        RegExp(r"^(\+201|1|01|00201)[0-2,5]{1}[0-9]{8}").hasMatch(value!);

    if (value.isEmpty) {
      return 'Please Enter your Phone Number';
    } else if (!isValid) {
      return 'Please Enter the correct phone number';
    }
    return null;
  }

  static String? emailValidator(String? value) {
    bool emailValid = RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value!);
    if (value.isEmpty) {
      return 'Please Enter your email ';
    } else if (!emailValid) {
      return 'Please Enter the correct email';
    }
    return null;
  }

  static String? passwordValidator(String? v) {
    if (v?.isEmpty ?? true) {
      return 'Please Enter your Phone Number';
    } else {
      return null;
    }
  }
}
