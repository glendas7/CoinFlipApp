import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'game_screen.dart';
import 'history_screen.dart';

class CoinScreen extends StatefulWidget {
  static const routeName = '/coinScreen';
  @override
  State<StatefulWidget> createState() {
    return _CoinScreenState();
  }
}

class _CoinScreenState extends State<CoinScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Play Heads or Tails'),
        backgroundColor: Colors.red[700],
        actions: [
          Align(
            alignment: Alignment.center,
            child: Text('Stats', style: Theme.of(context).textTheme.headline6),
          ),
          IconButton(
              icon: Icon(Icons.person_add_outlined),
              onPressed: () => {
                    Navigator.pushNamed(context, HistoryScreen.routeName),
                  }),
        ],
      ),
      backgroundColor: Colors.grey[500],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 100.0, 10.0, 0.0),
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: [
              Image.asset('images/Press_Button.png'),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: ButtonTheme(
                  minWidth: 100.0,
                  height: 50.0,
                  buttonColor: Colors.red[600],
                  child: RaisedButton(
                    onPressed: () => {
                      Navigator.pushNamed(context, GameScreen.routeName),
                    },
                    child: Text('Start',
                        style: Theme.of(context).textTheme.headline5),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
