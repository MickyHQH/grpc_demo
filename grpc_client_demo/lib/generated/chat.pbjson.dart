///
//  Generated code. Do not modify.
//  source: chat.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,constant_identifier_names,deprecated_member_use_from_same_package,directives_ordering,library_prefixes,non_constant_identifier_names,prefer_final_fields,return_of_invalid_type,unnecessary_const,unnecessary_import,unnecessary_this,unused_import,unused_shown_name

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use userRequestDescriptor instead')
const UserRequest$json = const {
  '1': 'UserRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `UserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userRequestDescriptor = $convert.base64Decode('CgtVc2VyUmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');
@$core.Deprecated('Use userResponseDescriptor instead')
const UserResponse$json = const {
  '1': 'UserResponse',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
};

/// Descriptor for `UserResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userResponseDescriptor = $convert.base64Decode('CgxVc2VyUmVzcG9uc2USDgoCaWQYASABKAlSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWU=');
@$core.Deprecated('Use serverStreamingOldChatRequestDescriptor instead')
const ServerStreamingOldChatRequest$json = const {
  '1': 'ServerStreamingOldChatRequest',
  '2': const [
    const {'1': 'partnerId', '3': 1, '4': 1, '5': 9, '10': 'partnerId'},
    const {'1': 'message_count', '3': 2, '4': 1, '5': 5, '10': 'messageCount'},
    const {'1': 'message_interval', '3': 3, '4': 1, '5': 5, '10': 'messageInterval'},
  ],
};

/// Descriptor for `ServerStreamingOldChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverStreamingOldChatRequestDescriptor = $convert.base64Decode('Ch1TZXJ2ZXJTdHJlYW1pbmdPbGRDaGF0UmVxdWVzdBIcCglwYXJ0bmVySWQYASABKAlSCXBhcnRuZXJJZBIjCg1tZXNzYWdlX2NvdW50GAIgASgFUgxtZXNzYWdlQ291bnQSKQoQbWVzc2FnZV9pbnRlcnZhbBgDIAEoBVIPbWVzc2FnZUludGVydmFs');
@$core.Deprecated('Use serverStreamingOldChatResponseDescriptor instead')
const ServerStreamingOldChatResponse$json = const {
  '1': 'ServerStreamingOldChatResponse',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'userName', '3': 2, '4': 1, '5': 9, '10': 'userName'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ServerStreamingOldChatResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List serverStreamingOldChatResponseDescriptor = $convert.base64Decode('Ch5TZXJ2ZXJTdHJlYW1pbmdPbGRDaGF0UmVzcG9uc2USFgoGdXNlcklkGAEgASgJUgZ1c2VySWQSGgoIdXNlck5hbWUYAiABKAlSCHVzZXJOYW1lEhgKB21lc3NhZ2UYAyABKAlSB21lc3NhZ2U=');
@$core.Deprecated('Use candidateRequestDescriptor instead')
const CandidateRequest$json = const {
  '1': 'CandidateRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
    const {'1': 'queueIndex', '3': 2, '4': 1, '5': 5, '10': 'queueIndex'},
    const {'1': 'status', '3': 3, '4': 1, '5': 9, '10': 'status'},
  ],
};

/// Descriptor for `CandidateRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List candidateRequestDescriptor = $convert.base64Decode('ChBDYW5kaWRhdGVSZXF1ZXN0Eg4KAmlkGAEgASgJUgJpZBIeCgpxdWV1ZUluZGV4GAIgASgFUgpxdWV1ZUluZGV4EhYKBnN0YXR1cxgDIAEoCVIGc3RhdHVz');
@$core.Deprecated('Use candidateResponseDescriptor instead')
const CandidateResponse$json = const {
  '1': 'CandidateResponse',
  '2': const [
    const {'1': 'items', '3': 1, '4': 3, '5': 11, '6': '.grpc_demo.CandidateRequest', '10': 'items'},
  ],
};

/// Descriptor for `CandidateResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List candidateResponseDescriptor = $convert.base64Decode('ChFDYW5kaWRhdGVSZXNwb25zZRIxCgVpdGVtcxgBIAMoCzIbLmdycGNfZGVtby5DYW5kaWRhdGVSZXF1ZXN0UgVpdGVtcw==');
@$core.Deprecated('Use joinChanelChatRequestDescriptor instead')
const JoinChanelChatRequest$json = const {
  '1': 'JoinChanelChatRequest',
  '2': const [
    const {'1': 'chanelId', '3': 1, '4': 1, '5': 9, '10': 'chanelId'},
    const {'1': 'userId', '3': 2, '4': 1, '5': 5, '10': 'userId'},
  ],
};

/// Descriptor for `JoinChanelChatRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List joinChanelChatRequestDescriptor = $convert.base64Decode('ChVKb2luQ2hhbmVsQ2hhdFJlcXVlc3QSGgoIY2hhbmVsSWQYASABKAlSCGNoYW5lbElkEhYKBnVzZXJJZBgCIAEoBVIGdXNlcklk');
@$core.Deprecated('Use chanelInfoResponseDescriptor instead')
const ChanelInfoResponse$json = const {
  '1': 'ChanelInfoResponse',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'userName', '3': 2, '4': 1, '5': 9, '10': 'userName'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ChanelInfoResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List chanelInfoResponseDescriptor = $convert.base64Decode('ChJDaGFuZWxJbmZvUmVzcG9uc2USFgoGdXNlcklkGAEgASgJUgZ1c2VySWQSGgoIdXNlck5hbWUYAiABKAlSCHVzZXJOYW1lEhgKB21lc3NhZ2UYAyABKAlSB21lc3NhZ2U=');
@$core.Deprecated('Use observeMessageRequestDescriptor instead')
const ObserveMessageRequest$json = const {
  '1': 'ObserveMessageRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'chanelId', '3': 4, '4': 1, '5': 9, '10': 'chanelId'},
  ],
};

/// Descriptor for `ObserveMessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List observeMessageRequestDescriptor = $convert.base64Decode('ChVPYnNlcnZlTWVzc2FnZVJlcXVlc3QSFgoGdXNlcklkGAEgASgJUgZ1c2VySWQSGgoIY2hhbmVsSWQYBCABKAlSCGNoYW5lbElk');
@$core.Deprecated('Use messageRequestDescriptor instead')
const MessageRequest$json = const {
  '1': 'MessageRequest',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'userName', '3': 2, '4': 1, '5': 9, '10': 'userName'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'chanelId', '3': 4, '4': 1, '5': 9, '10': 'chanelId'},
  ],
};

/// Descriptor for `MessageRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageRequestDescriptor = $convert.base64Decode('Cg5NZXNzYWdlUmVxdWVzdBIWCgZ1c2VySWQYASABKAlSBnVzZXJJZBIaCgh1c2VyTmFtZRgCIAEoCVIIdXNlck5hbWUSGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZRIaCghjaGFuZWxJZBgEIAEoCVIIY2hhbmVsSWQ=');
@$core.Deprecated('Use messageResponseDescriptor instead')
const MessageResponse$json = const {
  '1': 'MessageResponse',
  '2': const [
    const {'1': 'userId', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    const {'1': 'userName', '3': 2, '4': 1, '5': 9, '10': 'userName'},
    const {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
    const {'1': 'chanelId', '3': 4, '4': 1, '5': 9, '10': 'chanelId'},
  ],
};

/// Descriptor for `MessageResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List messageResponseDescriptor = $convert.base64Decode('Cg9NZXNzYWdlUmVzcG9uc2USFgoGdXNlcklkGAEgASgJUgZ1c2VySWQSGgoIdXNlck5hbWUYAiABKAlSCHVzZXJOYW1lEhgKB21lc3NhZ2UYAyABKAlSB21lc3NhZ2USGgoIY2hhbmVsSWQYBCABKAlSCGNoYW5lbElk');
@$core.Deprecated('Use emptyDescriptor instead')
const Empty$json = const {
  '1': 'Empty',
};

/// Descriptor for `Empty`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List emptyDescriptor = $convert.base64Decode('CgVFbXB0eQ==');
