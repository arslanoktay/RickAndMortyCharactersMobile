import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/views/screens/characters_view/charactgers_viewmodel.dart';
import 'package:rickandmorty/views/widgets/appbar_widget.dart';
import 'package:rickandmorty/views/widgets/character_cardlistview.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({super.key});

  @override
  State<StatefulWidget> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  @override
  void initState() {
    super.initState();
    context.read<CharactgersViewmodel>().getCharacters();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CharactgersViewmodel>(); // kullanılacak yerin consumer altında kaldığı için buradan izlemek gerekiyor
    return Scaffold(
      appBar: const AppbarWidget(title: 'Rick and Morty'),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Column(
            // alt alta geleceği için
            children: [
              _searchInputWidget(context, viewModel: viewModel),
              viewModel.characterModel == null
                  ? const CircularProgressIndicator.adaptive()
                  : CharacterCardlistview(
                      characters: viewModel.characterModel!.characters,
                      onLoadMore: () => viewModel.getCharacterMore,
                      loadMore: viewModel.loadMore,
                    )
            ],
          ),
        ),
      ),
    );
  }

  Padding _searchInputWidget(BuildContext context,
      {required CharactgersViewmodel viewModel}) {
    return Padding(
      padding: const EdgeInsets.only(top: 12, bottom: 16),
      child: TextFormField(
        // Arama yeri / arama yapabilmek için textformfield oldu
        textInputAction: TextInputAction.search, // sağ alttaki icon buna göre belirleyecek
        onFieldSubmitted: viewModel.getCharactersByName,
        decoration: InputDecoration(
            hintText: "Karakterlerde Ara",
            hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.search), // en sola vermek için prefix kullandık sıralamada sağda çünkü
            suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)) // Sağ tarafa eklemesi için suffix
            ),
      ),
    );
  }
}
