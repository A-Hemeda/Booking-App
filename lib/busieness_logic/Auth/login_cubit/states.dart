
import '../../../data/Auth/models/login_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates
{
  final LoginModel? loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginStates
{
  final String error;

  LoginErrorState(this.error);
}
class LoginwrongState extends LoginStates
{
  final LoginModel error;

  LoginwrongState(this.error);
}

