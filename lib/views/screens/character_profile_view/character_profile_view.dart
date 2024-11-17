import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/models/episode_model.dart';
import 'package:rickandmorty/views/screens/character_profile_view/character_profile_viewmodel.dart';
import 'package:rickandmorty/views/widgets/appbar_widget.dart';

class CharacterProfileView extends StatefulWidget {
  final CharacterModel characterModel;
  const CharacterProfileView({super.key, required this.characterModel});

  @override
  State<CharacterProfileView> createState() => _CharacterProfileViewState();
}

class _CharacterProfileViewState extends State<CharacterProfileView> {

  @override
  void initState() {
    context.read<CharacterProfileViewmodel>().getEpisodes(widget.characterModel.episode);
    super.initState();
  }

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
              _characterAvatar(context),
              Expanded( // container ı genişletebildiği kadar genişletiyor böylece kaplıyor görsel altta kaldı
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(50))
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 13,),
                      _characterName(),
                      const SizedBox(height: 15,),
                      _labelsView(context),
                      const SizedBox(height: 38,),
                      _scenesTitle(),
                      const SizedBox(height: 15,),
                      _episodeView()
                    ],
                  ),
                ),
              )
            ],
          )
        )
      ),
    );
  }

  Flexible _episodeView() {
    return Flexible(
                      child: Consumer<CharacterProfileViewmodel>(builder: (context, viewModel, child) { // characterprofileviewmodel ulaşmak için bununla wrapplemek gerekiyormuş
                        return ListView.separated(
                          padding: EdgeInsets.zero,
                          itemCount: viewModel.episodes.length,
                          itemBuilder: (context, index) {
                            final EpisodeModel model = viewModel.episodes[index];
                            return ListTile(
                              leading: const Icon(Icons.face_retouching_natural, size: 36),
                              trailing: const Icon(Icons.arrow_forward_sharp),
                              title: Text(model.episode, style: const TextStyle(fontWeight: FontWeight.w500),),
                              subtitle: Text(model.name, style: const TextStyle(
                                fontSize: 12
                              ),),
                            );
                          }, 
                          separatorBuilder: (context,index) => Divider(
                            color: Theme.of(context).colorScheme.tertiary,
                            indent: 40,
                            endIndent: 40,
                            height: 0,
                          ));
                      },),
                    );
  }

  Text _characterName() => Text(widget.characterModel.name, style: const TextStyle(fontSize:18,fontWeight: FontWeight.w500 ),);

  Container _scenesTitle() {
    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      alignment: Alignment.centerLeft,
                      child: Text('Bölümler (${widget.characterModel.episode.length})', style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500),)
                    );
  }

  Padding _labelsView(BuildContext context) {
    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45),
                      child: Wrap(
                        alignment: WrapAlignment.center,
                        runSpacing: 14,
                        spacing: 7,
                        children: [
                          _labelWidget(context, label: widget.characterModel.status),
                          _labelWidget(context, label: widget.characterModel.origin.name),
                          _labelWidget(context, label: widget.characterModel.gender),
                          _labelWidget(context, label: widget.characterModel.species),
                        ],
                      ),
                    );
  }

  Container _labelWidget(BuildContext context, {required String label}) {
    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 5),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(10) 
                      ),
                      child: Text(label, style: const TextStyle(fontSize: 12),),
                    );
  }

  Padding _characterAvatar(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(top: 90,bottom: 52),
              child: CircleAvatar(
                radius: 100,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: CircleAvatar( // Arka planda beyazlıkı için iç içe fazla radius lu var
                  radius: 98,
                  backgroundColor: Theme.of(context).colorScheme.surface,
                  child: Hero(
                    tag: widget.characterModel.image,
                    child: CircleAvatar(
                      backgroundColor: Theme.of(context).colorScheme.surface,
                      backgroundImage: NetworkImage(widget.characterModel.image),
                      radius: 95,
                    ),
                  ),
                ),
              ),
             );
  }
}