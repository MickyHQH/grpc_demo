///
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'chat.pb.dart' as $0;
export 'chat.pb.dart';

class ChatServiceClient extends $grpc.Client {
  static final _$getName = $grpc.ClientMethod<$0.UserRequest, $0.UserResponse>(
      '/grpc_demo.ChatService/GetName',
      ($0.UserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UserResponse.fromBuffer(value));
  static final _$serverStreamingOldChat = $grpc.ClientMethod<
          $0.ServerStreamingOldChatRequest, $0.ServerStreamingOldChatResponse>(
      '/grpc_demo.ChatService/ServerStreamingOldChat',
      ($0.ServerStreamingOldChatRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) =>
          $0.ServerStreamingOldChatResponse.fromBuffer(value));
  static final _$clientStreamingCandidate =
      $grpc.ClientMethod<$0.CandidateRequest, $0.CandidateResponse>(
          '/grpc_demo.ChatService/ClientStreamingCandidate',
          ($0.CandidateRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CandidateResponse.fromBuffer(value));
  static final _$bidirectionalStreamingCandidate =
      $grpc.ClientMethod<$0.CandidateRequest, $0.CandidateResponse>(
          '/grpc_demo.ChatService/BidirectionalStreamingCandidate',
          ($0.CandidateRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.CandidateResponse.fromBuffer(value));
  static final _$send = $grpc.ClientMethod<$0.MessageRequest, $0.Empty>(
      '/grpc_demo.ChatService/Send',
      ($0.MessageRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.Empty.fromBuffer(value));
  static final _$subscribe =
      $grpc.ClientMethod<$0.ObserveMessageRequest, $0.MessageResponse>(
          '/grpc_demo.ChatService/Subscribe',
          ($0.ObserveMessageRequest value) => value.writeToBuffer(),
          ($core.List<$core.int> value) =>
              $0.MessageResponse.fromBuffer(value));

  ChatServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.UserResponse> getName($0.UserRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getName, request, options: options);
  }

  $grpc.ResponseStream<$0.ServerStreamingOldChatResponse>
      serverStreamingOldChat($0.ServerStreamingOldChatRequest request,
          {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$serverStreamingOldChat, $async.Stream.fromIterable([request]),
        options: options);
  }

  $grpc.ResponseFuture<$0.CandidateResponse> clientStreamingCandidate(
      $async.Stream<$0.CandidateRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$clientStreamingCandidate, request,
            options: options)
        .single;
  }

  $grpc.ResponseStream<$0.CandidateResponse> bidirectionalStreamingCandidate(
      $async.Stream<$0.CandidateRequest> request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$bidirectionalStreamingCandidate, request,
        options: options);
  }

  $grpc.ResponseFuture<$0.Empty> send($0.MessageRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$send, request, options: options);
  }

  $grpc.ResponseStream<$0.MessageResponse> subscribe(
      $0.ObserveMessageRequest request,
      {$grpc.CallOptions? options}) {
    return $createStreamingCall(
        _$subscribe, $async.Stream.fromIterable([request]),
        options: options);
  }
}

abstract class ChatServiceBase extends $grpc.Service {
  $core.String get $name => 'grpc_demo.ChatService';

  ChatServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.UserRequest, $0.UserResponse>(
        'GetName',
        getName_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UserRequest.fromBuffer(value),
        ($0.UserResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ServerStreamingOldChatRequest,
            $0.ServerStreamingOldChatResponse>(
        'ServerStreamingOldChat',
        serverStreamingOldChat_Pre,
        false,
        true,
        ($core.List<$core.int> value) =>
            $0.ServerStreamingOldChatRequest.fromBuffer(value),
        ($0.ServerStreamingOldChatResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CandidateRequest, $0.CandidateResponse>(
        'ClientStreamingCandidate',
        clientStreamingCandidate,
        true,
        false,
        ($core.List<$core.int> value) => $0.CandidateRequest.fromBuffer(value),
        ($0.CandidateResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CandidateRequest, $0.CandidateResponse>(
        'BidirectionalStreamingCandidate',
        bidirectionalStreamingCandidate,
        true,
        true,
        ($core.List<$core.int> value) => $0.CandidateRequest.fromBuffer(value),
        ($0.CandidateResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.MessageRequest, $0.Empty>(
        'Send',
        send_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.MessageRequest.fromBuffer(value),
        ($0.Empty value) => value.writeToBuffer()));
    $addMethod(
        $grpc.ServiceMethod<$0.ObserveMessageRequest, $0.MessageResponse>(
            'Subscribe',
            subscribe_Pre,
            false,
            true,
            ($core.List<$core.int> value) =>
                $0.ObserveMessageRequest.fromBuffer(value),
            ($0.MessageResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.UserResponse> getName_Pre(
      $grpc.ServiceCall call, $async.Future<$0.UserRequest> request) async {
    return getName(call, await request);
  }

  $async.Stream<$0.ServerStreamingOldChatResponse> serverStreamingOldChat_Pre(
      $grpc.ServiceCall call,
      $async.Future<$0.ServerStreamingOldChatRequest> request) async* {
    yield* serverStreamingOldChat(call, await request);
  }

  $async.Future<$0.Empty> send_Pre(
      $grpc.ServiceCall call, $async.Future<$0.MessageRequest> request) async {
    return send(call, await request);
  }

  $async.Stream<$0.MessageResponse> subscribe_Pre($grpc.ServiceCall call,
      $async.Future<$0.ObserveMessageRequest> request) async* {
    yield* subscribe(call, await request);
  }

  $async.Future<$0.UserResponse> getName(
      $grpc.ServiceCall call, $0.UserRequest request);
  $async.Stream<$0.ServerStreamingOldChatResponse> serverStreamingOldChat(
      $grpc.ServiceCall call, $0.ServerStreamingOldChatRequest request);
  $async.Future<$0.CandidateResponse> clientStreamingCandidate(
      $grpc.ServiceCall call, $async.Stream<$0.CandidateRequest> request);
  $async.Stream<$0.CandidateResponse> bidirectionalStreamingCandidate(
      $grpc.ServiceCall call, $async.Stream<$0.CandidateRequest> request);
  $async.Future<$0.Empty> send(
      $grpc.ServiceCall call, $0.MessageRequest request);
  $async.Stream<$0.MessageResponse> subscribe(
      $grpc.ServiceCall call, $0.ObserveMessageRequest request);
}
