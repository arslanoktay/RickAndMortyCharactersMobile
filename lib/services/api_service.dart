import 'package:dio/dio.dart';
import 'package:rickandmorty/models/characters_model.dart';

class ApiService {
    final _dio = Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com/api'));

    Future<CharactersModel> getCharacters({String? url, Map<String,dynamic>? args}) async {
      try {
        // diğer sayfaları ayırabilmek talep edebilmek için url parametresi var, parametre yoksa ilk sayfa
        final response = await _dio.get(url ?? '/character', queryParameters: args); // url sonuna ekleme ile fromquery verisi yazar sözlük gibi çalışmalı
        return CharactersModel.fromJson(response.data); // data diyerek içindeki veriyi alıyoruz.
      } catch (e) {
         rethrow;
      }
    }
    
}

