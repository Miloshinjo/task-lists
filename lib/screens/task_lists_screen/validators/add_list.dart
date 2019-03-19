class AddListValidator {
  static String validate(String value) {
    if (value.isEmpty) return 'Please enter a name';
    if (value.length > 15) return 'List name is too long';
    if (value.length < 3) return 'List name too short';

    return null;
  }
}
