import 'package:flutter/material.dart';
import 'package:rickandmorty/app/locator.dart';
import 'package:rickandmorty/models/episode_model.dart';
import 'package:rickandmorty/services/api_service.dart';

class SectionsViewmodel extends ChangeNotifier {
  final _apiService = locator<ApiService>();

  EpisodesModel? _episodeModel;
  EpisodesModel? get episodeModel => _episodeModel; 

  void getEpisodes() async {
    _episodeModel = await _apiService.getAllEpisodes();
    notifyListeners();
  }

  bool loadMore = false;
  int _page = 1;

  void setLoadMore(bool value) {
    loadMore = value;
    notifyListeners();
  }

  void onLoadMore() async {
    if (loadMore && _page == _episodeModel!.info.pages) return;

    setLoadMore(true);
    final data = await _apiService.getAllEpisodes(url: _episodeModel?.info.next);
    _page++;
    _episodeModel!.info = data.info;
    _episodeModel!.episodes.addAll(data.episodes);
    setLoadMore(false);
  }
}