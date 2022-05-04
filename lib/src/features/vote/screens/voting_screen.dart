import 'package:evoting/src/core/widgets/atoms/padding.dart';
import 'package:evoting/src/features/vote/bloc/vote_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';

import '../../../core/constants/constants.dart';

class VotingScreen extends StatefulWidget {
  const VotingScreen({Key? key}) : super(key: key);

  @override
  State<VotingScreen> createState() => _VotingScreenState();
}

class _VotingScreenState extends State<VotingScreen> {
  late Client httpClient;

  late Web3Client ethClient;

  @override
  void initState() {
    httpClient = Client();
    ethClient = Web3Client(blockchainUrl, httpClient);
    BlocProvider.of<VoteBloc>(context).getTotalVotes();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<VoteBloc>(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(30),
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        CircleAvatar(
                          child: Text("A"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Total Votes: ${bloc.totalVotesA ?? ""}",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                          child: Text("B"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text("Total Votes: ${bloc.totalVotesB ?? ""}",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold))
                      ],
                    ),
                  ],
                ),
              ),
              padding32,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      bloc.add(VoteCandidate(
                          candidateId: '', context: context, isAlpha: true));
                    },
                    child: Text('Vote Alpha'),
                    style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      bloc.add(VoteCandidate(
                          candidateId: '', context: context, isAlpha: false));
                    },
                    child: Text('Vote Beta'),
                    style: ElevatedButton.styleFrom(shape: StadiumBorder()),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
