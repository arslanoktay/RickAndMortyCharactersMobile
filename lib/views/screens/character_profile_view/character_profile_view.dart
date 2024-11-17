import 'package:flutter/material.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/views/widgets/appbar_widget.dart';

class CharacterProfileView extends StatelessWidget {
  final CharacterModel characterModel;
  const CharacterProfileView({super.key, required this.characterModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea( // sarj seviyesi gibi ksıımlardan kurtulmak için ekledik(background üstünde kalıyorlar bozuyorlar)
      child: Scaffold(
        extendBodyBehindAppBar: true, // backgroundimage appbar da kaplasın diye true yapıldı
        appBar: const AppbarWidget(title: 'Karakter', transparentBackground: true,),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/backgroundRickandMorty.png'),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth
            )
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch, // ters açıyı kaplamasını sağlar
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 33,bottom: 52),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  backgroundImage: NetworkImage(characterModel.image),
                  radius: 100,
                ),
               )
            ],
          )
        )
      ),
    );
  }
}