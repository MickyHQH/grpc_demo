import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc_demo/candidate/candidate_bidirectional_page.dart';
import 'package:grpc_demo/provider/client_provider.dart';

import '../generated/chat.pb.dart';

class CandidatePage extends ConsumerStatefulWidget {
  const CandidatePage({Key? key}) : super(key: key);

  @override
  ConsumerState<CandidatePage> createState() => _CandidatePageState();
}

class _CandidatePageState extends ConsumerState<CandidatePage> {

  @override
  Widget build(BuildContext context) {
    final client = ref.watch(chatServiceProvider);
    client.clientStreamingCandidate();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Client streaming RPC'.toUpperCase()),
      ),
      backgroundColor: Colors.teal,
      body: Center(
        child: Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.7,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: _candidateLog(client)
              ),
              Expanded(
                  child: _candidateResponse(client)
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const CandidateBidirectionalPage())
                      );
                    },
                    child: const Icon(Icons.chevron_right_outlined)
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _candidateLog(ServiceState serviceState) {
    final listRequestWidget = [];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
            'CANDIDATE REQUEST',
          style: TextStyle(
              fontSize: 22
          ),
        ),
        const SizedBox(height: 7),
        Expanded(
          child: StreamBuilder(
              stream: serviceState.candidateStream,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  listRequestWidget.add(
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                            'UserId ${snapshot.data} is applied',
                          style: const TextStyle(
                            fontSize: 16
                          ),
                        ),
                      )
                  );
                  return ListView.builder(itemBuilder: (context, index) {
                    return listRequestWidget[index];
                  }, itemCount: listRequestWidget.length);
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('No candidate...'),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ],
    );
  }

  Widget _candidateResponse(ServiceState serviceState) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SERVER RESSPONCE',
          style: TextStyle(
              fontSize: 22
          ),
        ),
        const SizedBox(height: 7),
        Expanded(
          child: StreamBuilder(
              stream: serviceState.candidateResponseStream,
              builder: (BuildContext context, snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data as CandidateResponse;
                  // return Text(data.items);
                  // listRequestWidget.add(
                  //     Padding(
                  //       padding: const EdgeInsets.all(3.0),
                  //       child: Text(
                  //         'UserId ${snapshot.data} is applied',
                  //         style: const TextStyle(
                  //             fontSize: 16
                  //         ),
                  //       ),
                  //     )
                  // );
                  return ListView.builder(itemBuilder: (context, index) {
                    final item = data.items[index];
                    return Text('UserId: ${item.id}\nQueue index: ${item.queueIndex}\nStatus: ${item.status}\n');
                  }, itemCount: data.items.length);
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text('No candidate...'),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ),
      ],
    );
  }
}
