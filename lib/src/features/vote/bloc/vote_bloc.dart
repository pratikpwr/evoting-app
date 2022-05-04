import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import '../../../core/constants/constants.dart';
import '../../../core/widgets/atoms/snackbar.dart';

part 'vote_event.dart';

part 'vote_state.dart';

class VoteBloc extends Bloc<VoteEvent, VoteState> {
  VoteBloc() : super(VoteInitial());

  late Client httpClient;

  late Web3Client ethClient;

  var totalVotesA;
  var totalVotesB;

  @override
  Stream<VoteState> mapEventToState(
    VoteEvent event,
  ) async* {
    if (event is VoteCandidate) yield* _mapVoteCandidateEventToState(event);
  }

  _mapVoteCandidateEventToState(VoteCandidate event) async* {
    showSnackBar(event.context, "Recording vote");
    //obtain private key for write operation
    Credentials key = EthPrivateKey.fromHex(ethHexPrivateKey);

    //obtain our contract from abi in json file
    final contract = await getContract();

    // extract function from json file
    final function = contract.function(
      event.isAlpha ? "voteAlpha" : "voteBeta",
    );

    //send transaction using the our private key, function and contract
    await ethClient.sendTransaction(
        key,
        Transaction.callContract(
            contract: contract, function: function, parameters: []),
        chainId: 4);
    ScaffoldMessenger.of(event.context).removeCurrentSnackBar();
    showSnackBar(event.context, "verifying vote");
    //set a 20 seconds delay to allow the transaction to be verified before trying to retrieve the balance
    Future.delayed(const Duration(seconds: 20), () {
      ScaffoldMessenger.of(event.context).removeCurrentSnackBar();
      showSnackBar(event.context, "retrieving votes");
      getTotalVotes();

      ScaffoldMessenger.of(event.context).clearSnackBars();
    });
  }

  Future<DeployedContract> getContract() async {
    String abiFile = await rootBundle.loadString("assets/contract.json");
    final contract = DeployedContract(ContractAbi.fromJson(abiFile, "Voting"),
        EthereumAddress.fromHex(contractAddress));

    return contract;
  }

  Future<List<dynamic>> callFunction(String name) async {
    final contract = await getContract();
    final function = contract.function(name);
    final result = await ethClient
        .call(contract: contract, function: function, params: []);
    return result;
  }

  Future<void> getTotalVotes() async {
    List<dynamic> resultsA = await callFunction("getTotalVotesAlpha");
    List<dynamic> resultsB = await callFunction("getTotalVotesBeta");
    totalVotesA = resultsA[0];
    totalVotesB = resultsB[0];
  }
}
