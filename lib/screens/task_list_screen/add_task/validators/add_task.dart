class AddTaskValidator {
  static String validate(String value) {
    if (value.isEmpty) return 'Task name can\'t be empty';
    if (value.length > 15) return 'Task name is too long';

    return null;
  }
}
