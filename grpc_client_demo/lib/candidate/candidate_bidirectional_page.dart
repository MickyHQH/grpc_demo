import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc_demo/provider/client_provider.dart';

import '../chat/chat_page.dart';
import '../congra/congraturation_page.dart';
import '../generated/chat.pb.dart';

class CandidateBidirectionalPage extends ConsumerStatefulWidget {
  const CandidateBidirectionalPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CandidateBidirectionalPage> createState() => _CandidatePageState();
}

class _CandidatePageState extends ConsumerState<CandidateBidirectionalPage> {

  @override
  Widget build(BuildContext context) {
    final client = ref.watch(chatServiceProvider);
    final stream = client.bidirectionalStreamingCandidate();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Bidirectional streaming RPC'.toUpperCase()),
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
                  child: _candidateResponse(stream)
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const ChatPage())
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

  Widget _candidateResponse(ResponseStream<CandidateResponse> stream) {
    final myList = <Widget>[];
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SERVER RESPONSE',
          style: TextStyle(
              fontSize: 22
          ),
        ),
        const SizedBox(height: 7),
        Expanded(
          child: StreamBuilder(
              stream: stream,
              builder: (BuildContext context, AsyncSnapshot<CandidateResponse> snapshot) {
                if (snapshot.hasData) {
                  final data = snapshot.data as CandidateResponse;
                  final item = data.items.first;
                  myList.add(
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text('UserId: ${item.id}\nQueue index: ${item.queueIndex}\nStatus: ${item.status}\n'),
                      )
                  );
                  return ListView.builder(itemBuilder: (context, index) {
                    return myList[index];
                  }, itemCount: myList.length);
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
