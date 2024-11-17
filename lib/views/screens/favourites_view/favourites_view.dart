import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/views/screens/favourites_view/favorites_viewmodel.dart';
import 'package:rickandmorty/views/widgets/character_cardlistview.dart';

class FavouritesView extends StatefulWidget {
  const FavouritesView({super.key});

  @override
  State<FavouritesView> createState() => _FavouritesViewState();
}

class _FavouritesViewState extends State<FavouritesView> {

  @override
  void initState() {
    super.initState();
    context.read<FavoritesViewmodel>().getFavorites(); // provider dan geliyor
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FavoritesViewmodel>();
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: viewModel.charactersList.isEmpty 
          ? const CircularProgressIndicator.adaptive() 
          : Column(
            children: [
              CharacterCardlistview(characters: viewModel.charactersList)
            ],
          ),
        ),
      ),
    );
  }
}