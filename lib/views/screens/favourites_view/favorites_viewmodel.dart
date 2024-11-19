import 'package:flutter/material.dart';
import 'package:rickandmorty/app/locator.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/services/api_service.dart';
import 'package:rickandmorty/services/preferences_service.dart';

class FavoritesViewmodel extends ChangeNotifier {
  final _preferencesService = locator<PreferencesService>();
  final _apiService = locator<ApiService>();
  List<int> _favorites = [];

  List<CharacterModel> _characterModel = [];
  List<CharacterModel> get charactersList => _characterModel;

  void getFavorites() {
    _favorites = _preferencesService.getSavedCharacters();
    _getCharacters();
  }

  void _getCharacters() async {
    _characterModel = await _apiService.getMultipleCharacters(_favorites);
    notifyListeners();
  }
}
