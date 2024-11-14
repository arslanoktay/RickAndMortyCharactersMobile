import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 17),
          child: Column( // alt alta geleceği için
            children: [
              _searchInputWidget(context),
              Container(
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(6)
                ),
                child: Row(
                  children: [
                    Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9hTWc3Ak2YM7wo6D5RItxI_3jIWipI6lYUQ&s') // doğru image değil ölçeklendirme hatası olabilir sayfaya bağlanmıyor
                  ],
                ),
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