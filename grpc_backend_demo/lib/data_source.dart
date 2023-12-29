import 'dart:async';

import 'package:grpc_backend/src/generated/chat.pb.dart';

Map<String, StreamController<MessageResponse>> messageObservers = {};

const listUser = [
  {
    "id" : "1",
    "name" : "Huy Ha"
  },
  {
    "id" : "2",
    "name" : "Rosy"
  },
  {
    "id" : "3",
    "name" : "Misha"
  },
  {
    "id" : "4",
    "name" : "Hana"
  },
  {
    "id" : "5",
    "name" : "Riana"
  }
];

List listOldMessage = [
  {
    "userId" : "1",
    "message" : "Huy Ha 1"
  },
  {
    "userId" : "2",
    "message" : "Huy Ha 1 1"
  },
  {
    "userId" : "1",
    "message" : "Huy Ha 1 1 1"
  },
  {
    "userId" : "2",
    "message" : "Huy Ha 1 1 1 1"
  },
  {
    "userId" : "1",
    "message" : "Huy Ha 1 1 1 1 1"
  },
  {
    "userId" : "2",
    "message" : "Huy Ha 1 1 1 1 1 1"
  },
];