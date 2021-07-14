import 'NetworkCall.dart';

abstract class LoginEvents {
  const LoginEvents();
}

class LoginAPIEvents extends LoginEvents {
  final String emailId;
  final String password;

  LoginAPIEvents({ this.emailId, this.password});
}

abstract class LoginState {
  const LoginState();
}

class InitalState extends LoginState {
  InitalState();
}

class LoadingState extends LoginState {
  LoadingState();
}

class SuccessState extends LoginState {
  final LoginRespone response;
  SuccessState({ this.response});
}

class ErrorState extends LoginState {
  ErrorState();
}
