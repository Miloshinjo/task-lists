import 'package:flutter_test/flutter_test.dart';

import 'package:task_lists/screens/task_list_screen/add_task/validators/add_task.dart';

void main() {
  test('empty input returns error string', () {
    var result = AddTaskValidator.validate('');

    expect(result, 'Task name can\'t be empty');
  });

  test('input longer then 15 chars returns error string', () {
    var result = AddTaskValidator.validate('This is more then 15 characters');

    expect(result, 'Task name is too long');
  });

  test('valid input returns null', () {
    var result = AddTaskValidator.validate('My Tasks');

    expect(result, null);
  });
}
