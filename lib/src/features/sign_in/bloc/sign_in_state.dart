part of 'sign_in_bloc.dart';

abstract class SignInState extends Equatable {
  const SignInState();
}

class SignInInitial extends SignInState {
  @override
  List<Object> get props => [];
}
class SignInLoading extends SignInState {
  @override
  List<Object> get props => [];
}
class VoterSignedIn extends SignInState {
  @override
  List<Object> get props => [];
}
class SignInFailed extends SignInState {
  @override
  List<Object> get props => [];
}
