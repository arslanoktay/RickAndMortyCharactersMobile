import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 17),
          child: Column( // alt alta geleceği için
            children: [
              SizedBox(height: 12,),
              TextField( // Arama yeri
                decoration: InputDecoration(
                  labelText: "Karakterlerde Ara",
                  border: OutlineInputBorder()
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}