import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:rickandmorty/app/locator.dart';
import 'package:rickandmorty/app/router.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/services/preferences_service.dart';

class CharacterCardView extends StatefulWidget {
  final CharacterModel characterModel;
  bool isFavorited;
  CharacterCardView({super.key, required this.characterModel, required this.isFavorited});

  @override
  State<CharacterCardView> createState() => _CharacterCardViewState();
}

class _CharacterCardViewState extends State<CharacterCardView> {

  void _favoriteCharacter() {
    if (widget.isFavorited) {
      locator<PreferencesService>().removeCharacter(widget.characterModel.id);
       widget.isFavorited = false;
    }else {
      locator<PreferencesService>().saveCharacter(widget.characterModel.id);
      widget.isFavorited = true;
    }
    
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell( // tıklana bilme özelliği eklemek için InkWell yada GestureDetector  koyduk
      onTap: () => context.push(AppRoutes.characterProfile, extra: widget.characterModel),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.secondary,
                          borderRadius: BorderRadius.circular(6)
                        ),
                        child: Row(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: Image.network(
                                widget.characterModel.image,
                                height: 100,
                              ) // doğru image değil ölçeklendirme hatası olabilir sayfaya bağlanmıyor
                            ),
                             Padding(
                              padding:  const EdgeInsets.symmetric(vertical: 6, horizontal: 17),
                              child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                       Text(widget.characterModel.name, style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                      )),
                                      const SizedBox(height: 5,),
                                      _infoWidget(typeFirst: 'Köken', value: widget.characterModel.species),
                                      const SizedBox(height: 4,),
                                      _infoWidget(typeFirst: 'Durum', value: '${widget.characterModel.status} - ${widget.characterModel.species}')
                                    ],
                                  ),
                            )
                          ],
                        ),
                      ),
            IconButton(onPressed: () {
              _favoriteCharacter();
            }, icon: Icon(widget.isFavorited ? Icons.bookmark : Icons.bookmark_border))
          ],
        ),
      ),
    );
  }

  Column _infoWidget({required String typeFirst, required String value}) {
    return  Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(typeFirst, style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w300
                            ),),
                            Text(value, style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500
                            ),),
                          ],
                        );
  }
}