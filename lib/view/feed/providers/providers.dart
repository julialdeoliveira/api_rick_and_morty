import 'package:game_stream/view/home/model/character_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final likedPostsProvider = StateProvider<List<CharacterModel>>((ref) => []);
final savedPostsProvider = StateProvider<List<CharacterModel>>((ref) => []);
