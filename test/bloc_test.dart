import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_case_demo/Bloc/login_bloc.dart';
import 'package:test_case_demo/Bloc/login_state_event.dart';
import 'package:test_case_demo/validator.dart';

void main() {
  group('Loginbloc', () {
    test('validation', () {
      final fieldValidator = FieldValidator();
      var result = fieldValidator.validateEmail('');
      expect(result, 'Enter Email');
    });

    blocTest(
      'emits [] when nothing is added',
      build: () => LoginBloc(),
      act: (bloc) => (bloc as LoginBloc).add(LoginAPIEvents(
          emailId: 'calendar_test@gmail.com', password: 'password')),
      expect: () => [isA<LoadingState>(), isA<SuccessState>()],
    );

    blocTest(
      'emits [] when nothing is added',
      build: () => LoginBloc(),
      act: (bloc) => (bloc as LoginBloc).add(
          LoginAPIEvents(emailId: 'rushita.panchal', password: 'password')),
      expect: () => [isA<LoadingState>(), isA<ErrorState>()],
    );
  });
}
