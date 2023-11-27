// matching various patterns for kinds of data

//  ** Checks the fields of the form for correct input
class Validator {
  Validator();

  String? email(String? value) {
    String emailPattern = r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+';
    RegExp emailRegExp = RegExp(emailPattern);
    if (value == null || value.isEmpty) {
      return null;
    } else if (!emailRegExp.hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? password(String? value) {
    var pattern = r'^.{6,}$';
    var regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return "Password must be 6 digits and must contain an uppercase letter \nand at least a number and a special character.";
    } else {
      return null;
    }
  }

  String? name(String? value) {
    if (value == "") {
      return null;
    } else if (value!.length < 6) {
      return "First name should be at least 3 characters long";
    }
    return null;
  }

  String? lastName(String? value) {
    if (value == "") {
      return null;
    } else if (value!.length < 6) {
      return "First name should be at least 3 characters long";
    }
    return null;
  }

  String? address(String? value) {
    if (value == "") {
      return null;
    } else if (value!.length < 10) {
      return "First name should be at least 3 characters long";
    }
    return null;
  }

  // String? name(String? value) {
  //   var pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
  //   var regex = RegExp(pattern);
  //   if (!regex.hasMatch(value!)) {
  //     return 'validator.name'.tr;
  //   } else {
  //     return null;
  //   }
  // }
}
