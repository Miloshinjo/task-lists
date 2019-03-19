import 'package:flutter_test/flutter_test.dart';

import 'package:task_lists/screens/task_lists_screen/validators/add_list.dart';

void main() {
  test('empty input returns error string', () {
    var result = AddListValidator.validate('');

    expect(result, 'List name can\'t be empty');
  });

  test('input longer then 15 chars returns error string', () {
    var result = AddListValidator.validate('This is more then 15 characters');

    expect(result, 'List name is too long');
  });

  test('valid input returns null', () {
    var result = AddListValidator.validate('My Tasks');

    expect(result, null);
  });
}

// if (value.isEmpty) return 'List name can\'t be empty';
// if (value.length > 15) return 'List name is too long';
