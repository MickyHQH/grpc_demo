
import 'dart:async';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grpc/grpc.dart';

import '../generated/chat.pbgrpc.dart';

final chatServiceProvider = Provider((ref) {
  final host = Platform.isAndroid ? '10.0.2.2' : 'localhost';

  final channel = ClientChannel(
    host,
    port: 50051,
    options: ChannelOptions(
      credentials: const ChannelCredentials.insecure(),
      codecRegistry:
      CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );
  return ServiceState(ChatServiceClient(channel, options: CallOptions(timeout: const Duration(seconds: 20))));
});

class ServiceState {
  final ChatServiceClient clientChannel;
  UserResponse? userResponse;

  ServiceState(this.clientChannel);

  getName(UserRequest userRequest) async {
    userResponse = await clientChannel.getName(userRequest);
    return userResponse;
  }


  StreamController? candidateController;
  Stream? get candidateStream => candidateController?.stream;
  StreamController? candidateResponseController;
  Stream? get candidateResponseStream => candidateResponseController?.stream;
  clientStreamingCandidate() {
    candidateController = StreamController<int>();
    candidateResponseController = StreamController<CandidateResponse>();
    clientChannel
        .clientStreamingCandidate(dummyListUserId())
        .then((p0) {
      candidateResponseController?.sink.add(p0);
    });
  }

  ResponseStream<CandidateResponse> bidirectionalStreamingCandidate() {
    candidateController = StreamController<int>();
    candidateResponseController = StreamController<CandidateResponse>();
    return clientChannel.bidirectionalStreamingCandidate(dummyListUserId());
  }

  Stream<CandidateRequest> dummyListUserId() async* {
    final list = [0, 1, 2, 3, 4, 5];
    list.shuffle();
    for (int i = 0; i< list.length; i++) {
      await Future.delayed(const Duration(milliseconds: 500), null);
      candidateController?.sink.add(list[i]);
      yield CandidateRequest(
        id: list[i].toString(),
        queueIndex: i
      );
    }
    candidateController?.close();
  }

  ResponseStream<ServerStreamingOldChatResponse> serverStreamingOldChat() {
    return clientChannel.serverStreamingOldChat(
        ServerStreamingOldChatRequest(partnerId: "1")
    );
  }

  // chat

  sendMessage() async {
    return clientChannel.send(
        MessageRequest(
          userId: userResponse!.id,
          userName: userResponse!.name,
          message: "Hello everyone, I'm Huy Ha",
          chanelId: "1"
        )
    );
  }

  ResponseStream<MessageResponse> observeMessage() {
    print("HUHUHUHUHUHUHUHUHUU");
    return clientChannel.subscribe(ObserveMessageRequest(userId: userResponse!.id));
  }
  // end chat
}
