import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Tutorials',
      theme: ThemeData(
        primaryColor: Colors.purple,
      ),
      home: Scaffold(
        appBar: AppBar(title: Center(child: Text('Firestore Backend'))),
        body: MyHomePage(),
      ),
    );
  }
}

class MockBandInfo {
  MockBandInfo({this.name, this.votes});

  final String name;
  final int votes;
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key}) : super(key: key);

  final List<MockBandInfo> _bandList = [
    MockBandInfo(name: 'Mo Bunny, Mo Problems', votes: 0),
    MockBandInfo(name: 'Jam and the Angry Biscuits', votes: 0),
    MockBandInfo(name: 'The Toddler Pockets', votes: 0),
    MockBandInfo(name: 'Everybody Loves My Pants', votes: 0),
  ];

  Widget _buildListItem(BuildContext context, MockBandInfo bandInfo) {
    return ListTile(
      title: Row(
        children: [
          Expanded(
            child: Text(
              bandInfo.name,
              style: Theme.of(context).textTheme.headline,
            ),
          ),
          Container(
            decoration: BoxDecoration(color: Colors.purple[50]),
            padding: EdgeInsets.all(10.0),
            child: Text(
              bandInfo.votes.toString(),
            ),
          ),
        ],
      ),
      onTap: () {
        print('Should increase votes here.');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemExtent: 80.0,
      itemCount: _bandList.length,
      itemBuilder: (context, index) {
        return _buildListItem(context, _bandList[index]);
      },
    );
  }
}
