
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rickandmorty/app/locator.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/services/preferences_service.dart';
import 'package:rickandmorty/views/widgets/character_cardview.dart';

class CharacterCardlistview extends StatefulWidget {
  final List<CharacterModel> characters;
  final VoidCallback? onLoadMore;
  final bool loadMore;
  const CharacterCardlistview({super.key, required this.characters, this.onLoadMore, this.loadMore = false});

  @override
  State<StatefulWidget> createState() => _CharacterCardListViewState();
}

class _CharacterCardListViewState extends State<CharacterCardlistview> {
  final _scrollController = ScrollController(); // ekran açıldığında listeyi dinlemey ealıcaz
  bool _isLoading = true;
  List<int> _favoritedList = [];
  
  @override
  void initState() {
    _getFavorites();
    _detectScrollBottom();
    super.initState();
  }

  void _setLoading(bool value) {
    _isLoading = value;
    setState(() {}); // TODO: setState tam olarak ne işe yarıyor
  }

  void _getFavorites() async {
    _favoritedList = locator<PreferencesService>().getSavedCharacters();
    _setLoading(false);
    setState(() {
      
    });
  }

  void _detectScrollBottom() {
    if (widget.onLoadMore != null){
      _scrollController.addListener( () {
      final maxSCroll = _scrollController.position.maxScrollExtent;
      final currentPosition = _scrollController.position.pixels;
      const int delta = 200; // 200 pixel kala istek atsın

      if (maxSCroll - currentPosition <= delta) {
        log('message');
        widget.onLoadMore!();
      }
    });
    }
    
  }


  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return const CircularProgressIndicator.adaptive();
    }else {
      return Flexible(
                    child: ListView.builder(
                      itemCount: widget.characters.length,
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        final charactermodel = widget.characters[index];
                        final bool isFavorited = _favoritedList.contains(charactermodel.id);
                        return Column(
                          children: [
                            CharacterCardView(characterModel: charactermodel,isFavorited: isFavorited),
                            // sonda ise yükleme işareti çıkarıyor
                            if (widget.loadMore && index == widget.characters.length -1)
                              const CircularProgressIndicator.adaptive(), 
                          ],
                        );
                      }
                    ),
                  ); 
    }
    
  }
}
// en alta indiğinde bize bildirmeli / controller listview bu özelliklerini verir