import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:l2p1/model/coin.dart';
import 'package:l2p1/model/stats.dart';
import 'coin_screen.dart';

class GameScreen extends StatefulWidget {
  static const routeName = '/gameScreen';
  @override
  State<StatefulWidget> createState() {
    return _GameScreenState();
  }
}

class _GameScreenState extends State<GameScreen> {
  _Controller con;
  Coin coin;
  Coin coinHead = faceList[1];
  bool selected = true;
  String faceName;
  String selectText = 'Select';

  @override
  void initState() {
    super.initState();
    con = _Controller(this);
  }

  void render(fn) {
    setState(fn);
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Heads or Tails'),
        backgroundColor: Colors.red[700],
      ),
      backgroundColor: Colors.grey[500],
      body: Align(
        child: GestureDetector(
          onTap: () {
            setState(() {
              selected = !selected;
            });
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
                child: Column(
                  children: [
                    Container(
                      child: selected
                          ? Text('Tails',
                              style: Theme.of(context).textTheme.headline3)
                          : Text('Heads',
                              style: Theme.of(context).textTheme.headline3),
                    ),
                    Container(
                      child: AnimatedContainer(
                        alignment: Alignment.topCenter,
                        duration: Duration(seconds: 2),
                        curve: Curves.fastOutSlowIn,
                        child: selected
                            ? Image.asset(faceList[1].imageURL,
                                width: 200.0, height: 200.0)
                            : Image.asset(faceList[0].imageURL,
                                width: 200.0, height: 200.0),
                      ),
                    ),
                    //change value of coinHead
                    Container(
                        child: selected ? con.makeTail() : con.makeHead()),
                    //see result
                    ButtonTheme(
                      minWidth: 100.0,
                      height: 50.0,
                      buttonColor: Colors.yellowAccent,
                      child: RaisedButton(
                        onPressed: () => {
                          con.showDetails(context),
                        },
                        child: Text(selectText,
                            style: Theme.of(context).textTheme.headline5),
                      ),
                    ),
                  ],
                ),
              ),
              ButtonTheme(
                minWidth: 100.0,
                height: 50.0,
                buttonColor: Colors.red[600],
                child: RaisedButton(
                  onPressed: () => {
                    Navigator.pushNamed(context, CoinScreen.routeName),
                  },
                  child: Text('Exit',
                      style: Theme.of(context).textTheme.headline5),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Controller {
  _GameScreenState state;
  _Controller(this.state);
  var rnd = new Random();
  int randomNum;
  int resultText;
  Coin robotCoin;
  Coin coinHead;
  Stats stats;
  String ans;

  void randomHead() {
    randomNum = rnd.nextInt(11);
    if (randomNum <= 5) {
      robotCoin = faceList[0];
    } else {
      robotCoin = faceList[1];
    }
    print(randomNum);
  }

  makeHead() {
    this.coinHead = faceList[0];
  }

  makeTail() {
    this.coinHead = faceList[1];
  }

  checkGuess() {
    if (coinHead.face == robotCoin.face) {
      ans = 'CORRECT';
      playerList[0].win++;
    } else {
      ans = 'INCORRECT';
      playerList[0].lose++;
    }
  }

  void showDetails(BuildContext context) {
    randomHead();
    checkGuess();
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[600],
        insetPadding: EdgeInsets.all(20),
        title: Text('Result'),
        actions: [
          FlatButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Play Again',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          FlatButton(
            onPressed: () => Navigator.pushNamed(context, CoinScreen.routeName),
            child: Text(
              'Exit',
              style: Theme.of(context).textTheme.headline5,
            ),
          )
        ],
        content: Card(
          color: Colors.red[500],
          elevation: 15.0,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text('You Selected : ${coinHead.face}',
                    style: Theme.of(context).textTheme.headline5),
                Text('Correct Answer: ${robotCoin.face}',
                    style: Theme.of(context).textTheme.headline5),
                Row(
                  children: [
                    Container(
                      child: Expanded(
                        child: Image.asset(robotCoin.imageURL,
                            width: 200.0, height: 200.0),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text('You Guess was \n' + ans,
                      style: Theme.of(context).textTheme.headline5),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
