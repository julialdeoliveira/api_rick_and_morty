import 'package:game_stream/view/home/model/character_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final listCharactersProvider = StateProvider<List<CharacterModel>>((ref) => []);
final listFollowingProvider = StateProvider<List<CharacterModel>>((ref) => []);
