
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/views/widgets/character_cardview.dart';

class CharacterCardlistview extends StatefulWidget {
  final List<CharacterModel> characters;
  final VoidCallback onLoadMore;
  const CharacterCardlistview({super.key, required this.characters, required this.onLoadMore});

  
  
  
  @override
  State<StatefulWidget> createState() => _CharacterCardListViewState();
}
class _CharacterCardListViewState extends State<CharacterCardlistview> {

  final _scrollController = ScrollController(); // ekran açıldığında listeyi dinlemey ealıcaz


  @override
  void initState() {
    _detectScrollBottom();
    super.initState();
  }

  void _detectScrollBottom() {
    _scrollController.addListener( () {
      final maxSCroll = _scrollController.position.maxScrollExtent;
      final currentPosition = _scrollController.position.pixels;
      const int delta = 200; // 200 pixel kala istek atsın

      if (maxSCroll - currentPosition <= delta) {
        log('message');
        widget.onLoadMore();
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Flexible(
                    child: ListView.builder(
                      itemCount: widget.characters.length,
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        final charactermodel = widget.characters[index];
                        return CharacterCardView(characterModel: charactermodel);
                      }
                    ),
                  ); 
  }
}
// en alta indiğinde bize bildirmeli / controller listview bu özelliklerini verir