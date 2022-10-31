import 'package:dio/dio.dart';
import 'package:game_stream/shared/api/character_endpoint.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final characterEndpointProvider = Provider(
  (ref) {
    final dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));
    return CharacterEndpoint(dio);
  },
);
