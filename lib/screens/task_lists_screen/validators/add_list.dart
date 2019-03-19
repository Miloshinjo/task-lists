class AddListValidator {
  static String validate(String value) {
    if (value.isEmpty) return 'List name can\'t be empty';
    if (value.length > 15) return 'List name is too long';

    return null;
  }
}
