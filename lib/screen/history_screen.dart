import 'package:flutter/material.dart';
import 'package:l2p1/model/stats.dart';

class HistoryScreen extends StatefulWidget {
  static const routeName = '/historyScreen';
  @override
  State<StatefulWidget> createState() {
    return _HistoryScreenState();
  }
}

class _HistoryScreenState extends State<HistoryScreen> {
  Stats stats;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats'),
        backgroundColor: Colors.red[700],
      ),
      backgroundColor: Colors.grey[500],
      body: Column(
        children: [
          Text('Won: ${playerList[0].win}',
              style: Theme.of(context).textTheme.headline3),
          Text('Lost: ${playerList[0].lose}',
              style: Theme.of(context).textTheme.headline3),
        ],
      ),
    );
  }
}
