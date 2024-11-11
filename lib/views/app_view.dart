import 'package:flutter/material.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),

      // iki seçenek var, buttonnavigationbar material2.0 eski görünüm, NavigationBar yeni görünüm
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.face), label: 'Karakterler'),
          NavigationDestination(icon: Icon(Icons.bookmark), label: 'Favorilerim'),
          NavigationDestination(icon: Icon(Icons.location_on), label: 'Konumlar'),
          NavigationDestination(icon: Icon(Icons.menu), label: 'Menu'),
        ]
      ),
    );
  }

  AppBar _appBarWidget() {
    return AppBar(
      title: const Text(
        'Rick and Morty', 
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w500
        ),
        ),
        // Text sonrası rowda gösterilen widgetler. Genelde Iconbutton, popupmenu vb.
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.settings)) // the button ıcondan rengi geliyor
        ],
    );
  }
}