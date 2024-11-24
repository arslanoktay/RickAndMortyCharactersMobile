import 'package:get_it/get_it.dart';
import 'package:rickandmorty/services/api_service.dart';
import 'package:rickandmorty/services/preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

// her yere DI yapmamak için servisleri buna subscribe edicez ve main.dart da çağırıcaz
final locator = GetIt.instance;

Future<void> setupLocator() async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  locator.registerLazySingleton<PreferencesService>(
      () => PreferencesService(prefs: prefs));
  locator.registerLazySingleton<ApiService>(() => ApiService()); // herhangi bir yerde artık locator<ApiServise>() diyerek ulaa biliriz
}

// registerSingelton bir nesne luşur sürekli aynı nesne gelir.
// registerFactory her çağrıldığında yeni bir nesne!
// lazy hallerinde çağrılana kadar nesne oluştuurlmaz, kesin gerekmediğinde çağrılınca ancak oluşur