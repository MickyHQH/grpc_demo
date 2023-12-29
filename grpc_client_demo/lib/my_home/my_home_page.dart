import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc_demo/chat/chat_page.dart';
import 'package:grpc_demo/generated/chat.pb.dart';
import 'package:grpc_demo/generated/chat.pbgrpc.dart';
import 'package:grpc_demo/provider/client_provider.dart';

import '../old_messages/old_messages_page.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  ConsumerState<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  TextEditingController textController = TextEditingController();
  String currentName = "";

  @override
  Widget build(BuildContext context) {
    final client = ref.watch(chatServiceProvider);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('Unary RPC'.toUpperCase()),
      ),
      backgroundColor: Colors.teal,
      body: Center(
        child: Container(
          color: Colors.white,
          padding: const EdgeInsets.all(10),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Input user id to get name',
                style: TextStyle(
                    fontSize: 20
                ),
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(
                    width: 100,
                    height: 50,
                    child: TextField(
                      controller: textController,
                      maxLines: 1,
                      maxLength: 3,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Row(
                    children: [
                      ElevatedButton(
                          onPressed: () async {
                            currentName = (await client.getName(
                                UserRequest(id: textController.text)
                            )).name;
                            setState(() {});
                            Future.delayed(const Duration(milliseconds: 500), () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => const ChatPage())
                              );
                            });
                          },
                          child: const Icon(Icons.chat)
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                          onPressed: () async {
                            currentName = (await client.getName(
                                UserRequest(id: textController.text)
                            )).name;
                            setState(() {});
                            Future.delayed(const Duration(milliseconds: 500), () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => const OldMessagesPage())
                              );
                            });
                          },
                          child: const Icon(Icons.chevron_right_outlined)
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              (currentName.isNotEmpty)
                  ? Text(
                'Hello $currentName',
                style: const TextStyle(
                    fontSize: 18,
                    color: Colors.purple
                ),
              )
                  : const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
