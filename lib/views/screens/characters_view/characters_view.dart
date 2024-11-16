import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/views/screens/characters_view/charactgers_viewmodel.dart';
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
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 9),
          child: Column( // alt alta geleceği için
            children: [
              _searchInputWidget(context),
               Consumer<CharactgersViewmodel>(builder: (context, viewModel,child) {
                if (viewModel.characterModel == null) { // eğer karakter gelmemişse yükleme ekranı göster
                  return const CircularProgressIndicator.adaptive(); // ios için .adaptive sona eklenebiilir
                }else {
                  return CharacterCardlistview(
                    characters: viewModel.characterModel!.characters,
                    onLoadMore: () => viewModel.getCharacterMore(),
                    loadMore: viewModel.loadMore,
                  ); // listview yerine builder seçme neeni veri artarsa listview kasıyor ancak builder geride kalan veriyi siler böylece daha performanslı çalışır
                }
               },)
            ],
          ),
        ),
      ),
    );
  }

  Padding _searchInputWidget(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(top: 12,bottom: 16),
              child: TextFormField( // Arama yeri / arama yapabilmek için textformfield oldu
                textInputAction: TextInputAction.search, // sağ alttaki icon buna göre belirleyecek
                onFieldSubmitted: (value) {
                  
                },
                decoration: InputDecoration(
                  hintText: "Karakterlerde Ara",
                  hintStyle: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                  border: const OutlineInputBorder(),
                  prefixIcon: const Icon(Icons.search), // en sola vermek için prefix kullandık sıralamada sağda çünkü
                  suffixIcon: IconButton(onPressed: (){}, icon: const Icon(Icons.more_vert)) // Sağ tarafa eklemesi için suffix
                ),
              ),
            );
  }
}