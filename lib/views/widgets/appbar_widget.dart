import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool transparentBackground;
  const AppbarWidget({super.key, required this.title, this.transparentBackground = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: transparentBackground ? Colors.transparent : null,
      title: Text(
        title, 
        style: const TextStyle(
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
  
  @override
  Size get preferredSize => const Size.fromHeight(56);
}