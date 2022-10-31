import 'package:game_stream/shared/api/character_enpoint_provider.dart';
import 'package:game_stream/shared/api/repository/characters_repository.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final characterRepositoryProvider = Provider(
  (ref) {
    return CharactersRepository(
      ref.watch(characterEndpointProvider),
    );
  },
);
