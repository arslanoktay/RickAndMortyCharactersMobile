import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/models/episode_model.dart';
import 'package:rickandmorty/views/screens/section_characters_view/section_character_viewmodel.dart';
import 'package:rickandmorty/views/widgets/appbar_widget.dart';
import 'package:rickandmorty/views/widgets/character_cardlistview.dart';

class SectionCharactersView extends StatefulWidget {
  final EpisodeModel episodeModel;
  const SectionCharactersView({super.key, required this.episodeModel});

  @override
  State<SectionCharactersView> createState() => _SectionCharactersViewState();
}

class _SectionCharactersViewState extends State<SectionCharactersView> {

  @override
  void initState() {
    super.initState();
    context.read<SectionCharacterViewmodel>().getCharacters(widget.episodeModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget(title: widget.episodeModel.name),
      body:  Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          children: [
            Consumer<SectionCharacterViewmodel>(builder: (context, viewModel, child) {
              return CharacterCardlistview(
                characters: viewModel.characters,
              );
            })
          ],
        )
        ),
      );

  }
}