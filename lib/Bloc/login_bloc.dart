import 'package:flutter_bloc/flutter_bloc.dart';

import 'NetworkCall.dart';
import 'login_state_event.dart';

class LoginBloc extends Bloc<LoginAPIEvents, LoginState> {
  LoginBloc() : super(InitalState());

  @override
  Stream<LoginState> mapEventToState(LoginEvents event) async* {
    if (event is LoginAPIEvents) {
      yield* _mapEventToAPICalls(event);
    }
  }

  @override
  Stream<LoginState> _mapEventToAPICalls(LoginAPIEvents events) async* {
    try {
      yield LoadingState();
      final response = await NetworkCall().login(
          parameter: LoginParameters(
              email: events.emailId, password: events.password));
      if (response != null) {
        yield SuccessState(response: response);
      } else {
        yield ErrorState();
      }
    } on Exception catch (e) {
      yield ErrorState();
    }
  }
}
