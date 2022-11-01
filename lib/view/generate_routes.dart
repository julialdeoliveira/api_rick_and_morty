import 'package:flutter/cupertino.dart';
import 'package:game_stream/view/feed/feed_page.dart';
import 'package:game_stream/view/home/home_page.dart';
import 'package:game_stream/view/home/model/character_model.dart';
import 'package:game_stream/view/liked/liked_page.dart';
import 'package:game_stream/view/profile/profile_page.dart';
import 'package:game_stream/view/saved/saved_page.dart';
import 'package:game_stream/view/status/status_page.dart';

class GenerateRoute {
  static Route? findRoute(settings) {
    if (settings.name == FeedPage.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const FeedPage();
        },
      );
    }
    if (settings.name == HomePage.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return HomePage();
        },
      );
    }
    if (settings.name == LikedPage.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const LikedPage();
        },
      );
    }
    if (settings.name == SavedPage.route) {
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return const SavedPage();
        },
      );
    }
    if (settings.name == ProfilePage.route) {
      final args = settings.arguments as CharacterModel;
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return ProfilePage(
            character: args,
          );
        },
      );
    }
    if (settings.name == StatusPage.route) {
      final args = settings.arguments as CharacterModel;
      return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          return StatusPage(
            character: args,
          );
        },
      );
    }
    return null;
  }
}
