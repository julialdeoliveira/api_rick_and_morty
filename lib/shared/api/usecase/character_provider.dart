import 'package:game_stream/view/home/model/character_model.dart';
import 'package:game_stream/shared/api/repository/characters_repository_provider.dart';
import 'package:game_stream/shared/api/usecase/characters_usecase.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final characterProviderUsecase = Provider(
  (ref) {
    return CharacterUsecase(
      ref.read(characterRepositoryProvider),
    );
  },
);

final characterProvider = FutureProvider<List<CharacterModel>>(
  (ref) {
    return ref.read(characterProviderUsecase).execute();
  },
);
