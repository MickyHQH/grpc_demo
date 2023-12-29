import 'dart:async';

import 'package:grpc/grpc.dart';
import 'package:grpc_backend/src/generated/chat.pbgrpc.dart';

import 'data_source.dart';

class ChatService extends ChatServiceBase {

  ChatService(): super() {}

  @override
  Future<UserResponse> getName(ServiceCall call, UserRequest request) async {
    final user = listUser.where((element) => element["id"] == request.id).first;
    return UserResponse()
      ..name = user["name"] ?? ""
      ..id = user["id"] ?? "";
  }

  @override
  Stream<ServerStreamingOldChatResponse> serverStreamingOldChat(
      ServiceCall call, ServerStreamingOldChatRequest request) async* {
    for (var element in listOldMessage) {
      await Future.delayed(const Duration(milliseconds: 500), () {});
      yield ServerStreamingOldChatResponse(
          userId: element['userId'],
          userName: listUser.where((e) => e['id'] == element['userId']).first['name'],
          message: element['message']
      );
    }
  }

  @override
  Future<CandidateResponse> clientStreamingCandidate(ServiceCall call, Stream<CandidateRequest> request) async {

    List<CandidateRequest> list = [];
    final timer = Stopwatch();
    await for (var item in request) {
      if (!timer.isRunning) timer.start();
      list.add(
          CandidateRequest(
            id: item.id,
              queueIndex: item.queueIndex,
              status: "SAVED"
          )
      );
      await Future.delayed(const Duration(milliseconds: 100), () {
        // fake save data lost 100mls per one
      });
    }
    timer.stop();
    print("Save all data lost ${timer.elapsedMilliseconds}");
    return CandidateResponse(items: list);
  }

  @override
  Stream<CandidateResponse> bidirectionalStreamingCandidate(ServiceCall call, Stream<CandidateRequest> request) async* {
    await for (var item in request) {
      await Future.delayed(const Duration(milliseconds: 100), () {
        // fake save data lost 100mls per one
      });
      yield CandidateResponse(
        items: [
          CandidateRequest(
              id: item.id,
              queueIndex: item.queueIndex,
              status: "SAVED"
          )
        ]
      );
    }
  }

  @override
  Stream<MessageResponse> subscribe(ServiceCall call, ObserveMessageRequest request) async* {
    print("request.userId) ${request.userId}");
    deleteMessageObserver(request.userId);

    StreamController<MessageResponse>? controller = StreamController<MessageResponse>();
    addMessageObserver(request.userId, controller);
    Future.delayed(const Duration(milliseconds: 200), () async {
      for (final e in listOldMessage) {
        await Future.delayed(const Duration(milliseconds: 200), () {});
        final user = listUser.where((element) => element["id"] == e["userId"]).first;
        final h = MessageResponse(
            userId: user["id"],
            userName: user["name"],
            message: e["message"]
        );
        // print("subscribe MessageResponse $h");
        userMessageObserver(request.userId)?.sink.add(h);
      }
    });
    yield* userMessageObserver(request.userId)!.stream;
    print("messageObservers ${messageObservers.length}");
  }

  @override
  Future<Empty> send(ServiceCall call, MessageRequest request) async {
    final msg = {
      "userId" : request.userId,
      "message" : request.message
    };
    listOldMessage.add(msg);
    messageObservers.forEach((key, value) {
      value.sink.add(
          MessageResponse(
            userId: request.userId,
            userName: request.userName,
            message: request.message,
          )
      );
    });
    return Empty();
  }

  deleteMessageObserver(String userId) {
    final obs = messageObservers[userId];
    print("deleteMessageObserver is null ${obs == null}");
    if (obs != null) {
      obs.sink.addError("Your account is signed in by another people");
      obs.sink.close();
      print("deleteMessageObserver delete ${messageObservers.remove(userId)}");
    }
  }

  StreamController<MessageResponse>? userMessageObserver(String userId) =>
    messageObservers[userId];

  void addMessageObserver(String userId, StreamController<MessageResponse> controller) =>
      messageObservers[userId] = controller;
}

