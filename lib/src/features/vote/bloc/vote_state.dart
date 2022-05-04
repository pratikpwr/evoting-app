part of 'vote_bloc.dart';

abstract class VoteState extends Equatable {
  const VoteState();

  @override
  List<Object> get props => [];
}

class VoteInitial extends VoteState {}

class VoteLoading extends VoteState {}

class VoteSuccess extends VoteState {
  final String message;

  const VoteSuccess({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}

class VoteFailed extends VoteState {
  final String message;

  const VoteFailed({
    required this.message,
  });

  @override
  List<Object> get props => [message];
}
