part of 'sign_in_bloc.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
}

class SignInVoter extends SignInEvent {
  const SignInVoter({
    required this.number,
    required this.password,
  });

  final String number;
  final String password;

  @override
  List<Object> get props => [number, password];
}
