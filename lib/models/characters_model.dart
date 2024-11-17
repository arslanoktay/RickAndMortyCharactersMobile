// karşılayacak hepsini kapsayan class
class CharactersModel {
  CharacterInfo info;
  final List<CharacterModel> characters;

  CharactersModel({required this.info, required this.characters});
  
  // ctor kendini döndürüyorsa factory'dir
  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    final info = CharacterInfo.fromJson(json["info"]);
    final characters = (json['results'] as List).map(
      (characterJson) => CharacterModel.fromJson(characterJson),
     ).toList();

     return CharactersModel(info: info, characters: characters);
  }
     
}

class CharacterInfo {
  final int count;
  final int pages;
  final String? next;
  final String? prev;

  CharacterInfo({required this.count, required this.pages, required this.next, required this.prev});

  // json formatını nesneye dönüştürecek kod / bize json map<string,dynmaic> olarak gelecek / factory ile de yeni nesne döndürecek şekilde yazılabiliyor
  CharacterInfo.fromJson(Map<String,dynamic> json):
    count = json['count'],
    pages = json['pages'],
    next = json['next'],
    prev = json['prev'];
}

class CharacterModel {
  final int id;
  final String name;
  final String status;
  final Origin origin;
  final String species;
  final String gender;
  final String image;
  final Location location;
  final List<String> episode;

  CharacterModel(this.origin, {required this.id, required this.name, required this.status, required this.species, required this.gender, required this.image, required this.location, required this.episode});

  CharacterModel.fromJson(Map<String, dynamic> json):
    id = json['id'],
    name = json['name'],
    status = json['status'],
    species = json['species'],
    gender = json['gender'],
    image = json['image'],
    location = Location.fromJson(json['location']),
    episode = List<String>.from(json['episode']),
    origin = Origin.fromJson(json['origin']);
}

class Location {
  final String name;
  final String url;

  Location({required this.name, required this.url});

  Location.fromJson(Map<String,dynamic> json):
    name = json['name'],
    url = json['url'];
}

class Origin {
  final String name;
  final String url;

  Origin({required this.name, required this.url});

  Origin.fromJson(Map<String,dynamic> json)
    : name = json['name'],
      url = json['url'];
}