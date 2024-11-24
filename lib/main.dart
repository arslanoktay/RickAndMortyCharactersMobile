import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rickandmorty/app/locator.dart';
import 'package:rickandmorty/app/router.dart';
import 'package:rickandmorty/app/theme.dart';

void main() async {
  WidgetsFlutterBinding
      .ensureInitialized(); // flutter uyardı, asenkron başlatılacaksa bunu kullan dedi.
  await setupLocator(); // getit ile DI sız ulaşım
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => AppTheme()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppTheme>(
      builder: (context, viewModel, child) => MaterialApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: viewModel.theme, // uygulama temasını değiştirir
      ),
      
    );
  }
}
