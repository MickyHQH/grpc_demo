import 'package:grpc/grpc.dart';
import 'package:grpc_backend/chat_service.dart';

Future<void> main(List<String> args) async {
  final server = Server(
    [ChatService()],
    const <Interceptor>[],
    CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
  );
  await server.serve(port: 50051);
  print('Server listening on port ${server.port}...');
}