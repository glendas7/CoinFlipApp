import 'package:flutter/material.dart';
import 'screen/coin_screen.dart';
import 'screen/game_screen.dart';
import 'screen/history_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: CoinScreen.routeName, routes: {
      CoinScreen.routeName: (context) => CoinScreen(),
      HistoryScreen.routeName: (context) => HistoryScreen(),
      GameScreen.routeName: (context) => GameScreen(),
    });
  }
}
