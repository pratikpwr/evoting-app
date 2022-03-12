part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class SignUpEvent extends RegisterEvent {
  final String userName;
  final String email;
  final String password;

  const SignUpEvent({
    required this.userName,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [userName, email, password];
}
