import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xero_app_flutter/pages/home/home.dart';
import 'package:xero_app_flutter/providers/data_provider.dart';
import 'package:xero_app_flutter/providers/menu_text_provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => MenuTextProvider()),
    ChangeNotifierProvider(create: (context) => DataProvider()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Xero App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            minimumSize: WidgetStateProperty.all<Size>(
              const Size(200.0, 50.0),
            ),
          ),
        ),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
