import 'package:flutter/material.dart';
import 'package:rickandmorty/app/locator.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/models/episode_model.dart';
import 'package:rickandmorty/services/api_service.dart';

class SectionCharacterViewmodel extends ChangeNotifier {
  final _apiService = locator<ApiService>();

  List<CharacterModel> _characters = [];
  List<CharacterModel> get characters => _characters;

  void getCharacters(EpisodeModel episodeModel) async {
    _characters = await _apiService.getCharactersFromURLList(episodeModel.characters);
    notifyListeners();
  }
}