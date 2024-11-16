import 'package:flutter/material.dart';
import 'package:rickandmorty/app/locator.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/services/api_service.dart';

class CharactgersViewmodel extends ChangeNotifier { // changenotifer metotlar sunar dinleme gibi

   final _apiService = locator<ApiService>();

   CharactersModel? _charactersModel;
   CharactersModel? get characterModel => _charactersModel;
   
   // api ulaşıp _charactersmodel dolduracak ve sayfayı yenileyecek fonksiyon
   void getCharacters() async {
    _charactersModel = await _apiService.getCharacters();
    notifyListeners();
   }

  // zaten veri var, üzerine ekleyecek
  void getCharacterMore() async {
    final data = await _apiService.getCharacters(url: _charactersModel?.info.next);
    _charactersModel!.info = data.info;
    _charactersModel!.characters.addAll(data.characters); // sona yeni gelenleri ekleyecek
  }

}