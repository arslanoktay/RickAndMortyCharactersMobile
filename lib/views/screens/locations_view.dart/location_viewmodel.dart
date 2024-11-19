import 'package:flutter/foundation.dart';
import 'package:rickandmorty/app/locator.dart';
import 'package:rickandmorty/models/location_model.dart';
import 'package:rickandmorty/services/api_service.dart';

class LocationViewmodel extends ChangeNotifier {
  final _apiService = locator<ApiService>();

  LocationModel? _locationModel;
  LocationModel? get locationModel => _locationModel;

  void getLocations() async {
    _locationModel = await _apiService.getAllLocations();
    notifyListeners();
  }
}
