import 'package:flutter/material.dart';

class CharacterCardView extends StatelessWidget {
  final String image;
  final String name;
  final String origin;
  final String status;
  final String type;

  const CharacterCardView({super.key, required this.image, required this.name, required this.origin, required this.status, required this.type});

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
                              image,
                              height: 100,
                            ) // doğru image değil ölçeklendirme hatası olabilir sayfaya bağlanmıyor
                          ),
                           Padding(
                            padding:  const EdgeInsets.symmetric(vertical: 6, horizontal: 17),
                            child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                     Text(name, style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    )),
                                    const SizedBox(height: 5,),
                                    _infoWidget(typeFirst: 'Köken', value: origin),
                                    const SizedBox(height: 4,),
                                    _infoWidget(typeFirst: 'Durum', value: '$status - $type')
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