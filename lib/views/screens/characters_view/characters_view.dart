import 'package:flutter/material.dart';
import 'package:rickandmorty/views/widgets/character_cardview.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Column( // alt alta geleceği için
            children: [
              _searchInputWidget(context),
               const CharacterCardView(
                image: 'https://rickandmortyapi.com/api/character/avatar/320.jpeg',
                name: 'Rick Sanchez',
                origin: 'Earth - (C137)',
                status: 'Yaşıyor',
                type: 'İnsan' 
               ),
               const CharacterCardView(
                image: 'https://rickandmortyapi.com/api/character/avatar/320.jpeg',
                name: 'Rick Sanchez',
                origin: 'Earth - (C137)',
                status: 'Yaşıyor',
                type: 'İnsan' 
               )
            ],
          ),
        ),
      ),
    );
  }

  Padding _searchInputWidget(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(top: 12,bottom: 16),
              child: TextField( // Arama yeri
                decoration: InputDecoration(
                  labelText: "Karakterlerde Ara",
                  labelStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.search), // en sola vermek için prefix kullandık sıralamada sağda çünkü
                  suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)) // Sağ tarafa eklemesi için suffix
                ),
              ),
            );
  }
}