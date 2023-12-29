import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';
import 'package:grpc_demo/congra/congraturation_page.dart';
import 'package:grpc_demo/generated/chat.pb.dart';

import '../provider/client_provider.dart';

class ChatPage extends ConsumerStatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends ConsumerState<ChatPage> {
  TextEditingController controller = TextEditingController();
  final List<MessageResponse> messages = [];

  @override
  void initState() {
    // join chanel 1
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final client = ref.watch(chatServiceProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Chat'.toUpperCase()),
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
                  child: Column(
          children: <Widget>[
          Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: TextField(
            controller: controller,
          ),
        ),
        MaterialButton(
          child: const Text("Submit"),
          onPressed: () {
            // widget.service.sendMessage(controller.text);
            client.sendMessage();
            controller.clear();
          },
        ),
        Flexible(
          child: StreamBuilder(
              stream: client.observeMessage(),
              builder: (context, AsyncSnapshot<MessageResponse> snapshot) {
                print("HuY check ${snapshot}");
                if (snapshot.hasError) {
                  Future.delayed(const Duration(milliseconds: 500), () {
                    Navigator.of(context).popUntil((route) => route.isFirst);
                  });
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                }
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                messages.add(snapshot.data as MessageResponse);

                return ListView(
                  children: messages
                      .map((msg) => ListTile(
                    leading: Text(msg.userName),
                    title: Text(msg.message),
                    // subtitle: Text(msg.timestamp),
                  ))
                      .toList(),
                );
              }),
              ),
              ])),
              Align(
                alignment: Alignment.bottomRight,
                child: ElevatedButton(
                    onPressed: () async {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => const CongratulationPage())
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
}
