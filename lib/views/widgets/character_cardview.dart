import 'package:flutter/material.dart';
import 'package:rickandmorty/models/characters_model.dart';

class CharacterCardView extends StatelessWidget {
  final CharacterModel characterModel;

  const CharacterCardView({super.key, required this.characterModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
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
                              characterModel.image,
                              height: 100,
                            ) // doğru image değil ölçeklendirme hatası olabilir sayfaya bağlanmıyor
                          ),
                           Padding(
                            padding:  const EdgeInsets.symmetric(vertical: 6, horizontal: 17),
                            child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Text(characterModel.name, style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )),
                                    const SizedBox(height: 5,),
                                    _infoWidget(typeFirst: 'Köken', value: characterModel.species),
                                    const SizedBox(height: 4,),
                                    _infoWidget(typeFirst: 'Durum', value: '${characterModel.status} - ${characterModel.species}')
                                  ],
                                ),
                          )
                        ],
                      ),
                    ),
          IconButton(onPressed: (){}, icon:const Icon(Icons.bookmark_border))
        ],
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