import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppView extends StatelessWidget {
  final StatefulNavigationShell navigationShell;
  const AppView({super.key, required this.navigationShell});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarWidget(),
      body: navigationShell, // Seçili navigationbardan gelen konacak(path den gelen view)
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData( // Navigation bar text dinamik renk değiştirmesi buradan sağlanıyor
          labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
            if(states.contains(WidgetState.selected)){
              return TextStyle(color: Theme.of(context).colorScheme.primary);
            }else {
              return TextStyle(color: Theme.of(context).colorScheme.tertiary);
            }
          })
        ),
        child: NavigationBar( //!! iki seçenek var, buttonnavigationbar material2.0 eski görünüm, NavigationBar yeni görünüm
          selectedIndex: navigationShell.currentIndex, // aktif seçili index kısım buradan geliyor
          indicatorColor: Colors.transparent, // sanırım seçili kısım
          onDestinationSelected: navigationShell.goBranch, // hangisinin tıklandığını navigationshell e buradan bildiriyoruz
          destinations:  [
            _menuItem(
              context,
              currentIndex: navigationShell.currentIndex,
              index: 0,
              icon: Icons.face,
              label: 'Karakterler'
            ),
            _menuItem(
              context,
              currentIndex: navigationShell.currentIndex,
              index: 1,
              icon: Icons.bookmark,
              label: 'Favorilerim'
            ),
            _menuItem(
              context,
              currentIndex: navigationShell.currentIndex,
              index: 2,
              icon: Icons.location_on,
              label: 'Konumlar'
            ),
            _menuItem(
              context,
              currentIndex: navigationShell.currentIndex,
              index: 3,
              icon: Icons.menu,
              label: 'Menu'
            ),
            // En başta görünsün diye direk eklemiştik iptal
            // NavigationDestination(icon: Icon(Icons.face), label: 'Karakterler'),
            // NavigationDestination(icon: Icon(Icons.bookmark), label: 'Favorilerim'),
            // NavigationDestination(icon: Icon(Icons.location_on), label: 'Konumlar'),
            // NavigationDestination(icon: Icon(Icons.menu), label: 'Menu'),
          ]
        ),
      ),
    );
  }

  Widget _menuItem(BuildContext context,{required int index, required int currentIndex, required String label, required IconData icon}) { // kendi indexi ve seçili index
    return NavigationDestination(
      icon: Icon(icon, color: currentIndex == index ? Theme.of(context).colorScheme.primary:Theme.of(context).colorScheme.tertiary),
      label: label, // NavigationBarThemeData ile dinamik hale geliyor
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