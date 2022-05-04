part of 'vote_bloc.dart';

abstract class VoteEvent extends Equatable {
  const VoteEvent();
}

class VoteCandidate extends VoteEvent {
  final String candidateId;
  final BuildContext context;
  final bool isAlpha;

  const VoteCandidate({
    required this.candidateId,
    required this.context,
    required this.isAlpha,
  });

  @override
  List<Object> get props => [candidateId,context, isAlpha];
}
