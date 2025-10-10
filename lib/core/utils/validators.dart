class Validator {

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'البريد الإلكتروني مطلوب';
    }


    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (!emailRegex.hasMatch(value)) {
      return 'صيغة البريد الإلكتروني غير صحيحة';
    }

    if (value.length > 100) {
      return 'البريد الإلكتروني طويل جداً (الحد الأقصى 100 حرف)';
    }

    return null;
  }


  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'كلمة المرور مطلوبة';
    }

    if (value.length < 8) {
      return 'كلمة المرور يجب أن تكون 8 أحرف على الأقل';
    }

    if (value.length > 50) {
      return 'كلمة المرور طويلة جداً (الحد الأقصى 50 حرف)';
    }


    if (!value.contains(RegExp(r'[A-Z]'))) {
      return 'كلمة المرور يجب أن تحتوي على حرف كبير واحد على الأقل';
    }


    if (!value.contains(RegExp(r'[a-z]'))) {
      return 'كلمة المرور يجب أن تحتوي على حرف صغير واحد على الأقل';
    }


    if (!value.contains(RegExp(r'[0-9]'))) {
      return 'كلمة المرور يجب أن تحتوي على رقم واحد على الأقل';
    }


    if (!value.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return 'كلمة المرور يجب أن تحتوي على رمز خاص واحد على الأقل';
    }

    return null;
  }


  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'الاسم مطلوب';
    }

    final trimmedValue = value.trim();

    if (trimmedValue.length < 2) {
      return 'الاسم يجب أن يكون حرفين على الأقل';
    }

    if (trimmedValue.length > 50) {
      return 'الاسم طويل جداً (الحد الأقصى 50 حرف)';
    }


    final nameRegex = RegExp(r'^[\u0600-\u06FFa-zA-Z\s\-]+$');
    if (!nameRegex.hasMatch(trimmedValue)) {
      return 'الاسم يجب أن يحتوي على أحرف فقط';
    }

    return null;
  }


  // static String? validatePasswordConfirmation(
  //     String? password,
  //     String? confirmPassword,
  //     ) {
  //   if (confirmPassword == null || confirmPassword.isEmpty) {
  //     return 'تأكيد كلمة المرور مطلوب';
  //   }
  //
  //   if (password != confirmPassword) {
  //     return 'كلمة المرور غير متطابقة';
  //   }
  //
  //   return null;
  // }


  // static String? validatePhone(String? value) {
  //   if (value == null || value.isEmpty) {
  //     return 'رقم الهاتف مطلوب';
  //   }
  //
  //   final phoneRegex = RegExp(r'^[0-9]{10,15}$');
  //   if (!phoneRegex.hasMatch(value.replaceAll(RegExp(r'[\s\-\(\)]'), ''))) {
  //     return 'رقم الهاتف غير صحيح';
  //   }
  //
  //   return null;
  // }


  static String? validateRequired(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName مطلوب';
    }
    return null;
  }


  // static String? validateMinLength(
  //     String? value,
  //     int minLength,
  //     String fieldName,
  //     ) {
  //   if (value == null || value.isEmpty) {
  //     return '$fieldName مطلوب';
  //   }
  //
  //   if (value.length < minLength) {
  //     return '$fieldName يجب أن يكون $minLength أحرف على الأقل';
  //   }
  //
  //   return null;
  // }


  // static String? validateMaxLength(
  //     String? value,
  //     int maxLength,
  //     String fieldName,
  //     ) {
  //   if (value != null && value.length > maxLength) {
  //     return '$fieldName طويل جداً (الحد الأقصى $maxLength حرف)';
  //   }
  //
  //   return null;
  // }
}