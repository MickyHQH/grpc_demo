import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc_demo/generated/chat.pb.dart';
import 'package:grpc_demo/generated/chat.pbgrpc.dart';
import 'package:grpc_demo/provider/client_provider.dart';

import '../candidate/candidate_page.dart';

class OldMessagesPage extends ConsumerStatefulWidget {
  const OldMessagesPage({Key? key}) : super(key: key);

  @override
  ConsumerState<OldMessagesPage> createState() => _OldMessagesPageState();
}

class _OldMessagesPageState extends ConsumerState<OldMessagesPage> {

  @override
  Widget build(BuildContext context) {
    final client = ref.watch(chatServiceProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Server streaming RPC'.toUpperCase()),
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
              Expanded(child: _listConversations(client)),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                    onPressed: () {
                      Future.delayed(const Duration(milliseconds: 500), () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => const CandidatePage())
                        );
                      });
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

  Widget _listConversations(ServiceState serviceState) {
    final myList = <Widget>[];
    return StreamBuilder(
        stream: serviceState.serverStreamingOldChat(),
        builder: (BuildContext context, AsyncSnapshot<ServerStreamingOldChatResponse> snapshot) {
          if (snapshot.hasData) {
            myList.add(
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: RichText(
                      text: TextSpan(
                          text: "${snapshot.data?.userName}: ",
                          style: const TextStyle(
                              color: Colors.blue,
                            fontSize: 20
                          ),
                          children: [
                            TextSpan(
                              text: "${snapshot.data?.message}",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 18
                              ),
                            )
                          ]
                      )
                  ),
                )
            );
            return ListView.builder(itemBuilder: (context, index) {
              return myList[index];
            }, itemCount: myList.length);
          } else if (snapshot.hasError) {
            return const Center(
              child: Text('No messages...'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
