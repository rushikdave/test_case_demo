import 'package:flutter_test/flutter_test.dart';
import 'package:test_case_demo/validator.dart';

void main() {
  group('validation check', () {
    test('validate email id', () {
      final fieldValidator = FieldValidator();
      var result = fieldValidator.validateEmail('');
      expect(result, 'Enter Email');
    });

    test('validate email id', () {
      final fieldValidator = FieldValidator();
      var result = fieldValidator.validateEmail('rushita@gmail.com');
      expect(result, '');
    });
  });
}
