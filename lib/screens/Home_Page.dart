import 'dart:io';

import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  final List<FileSystemEntity> listItems;
  ListScreen(this.listItems);

  @override
  State<StatefulWidget> createState() {
    return _ListScreenState(listItems);
  }
}

class _ListScreenState extends State<ListScreen> {
  final List<FileSystemEntity> listItems;
  _ListScreenState(this.listItems);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Stack(
          children: <Widget>[
            Container(
              height: screenHeight,
              width: screenWidth,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/day.jpeg'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 45.0, left: 20.0, right: 20.0),
                  child: Container(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    height: 40.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        color: Color(0xFF274B61)),
                    child: Center(
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search your songs',
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontFamily: 'Montserrat',
                            ),
                            isDense: false,
                            suffixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            )),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: Container(
                    height: screenHeight - 40.0,
                    child: GetListView(listItems),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context, String item) {
  var snackBar = SnackBar(
    content: Text("you just tapped $item"),
    action: SnackBarAction(
        label: "UNDO",
        onPressed: () {
          debugPrint("dummy undo button");
        }),
  );
  Scaffold.of(context).showSnackBar(snackBar);
}

class GetListView extends StatefulWidget {
  final List<FileSystemEntity> listItems;
  GetListView(this.listItems);

  @override
  State<StatefulWidget> createState() {
    return _GetListViewState(listItems);
  }
}

class _GetListViewState extends State<GetListView> {
  final List<FileSystemEntity> listItems;
  _GetListViewState(this.listItems);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Card(
        elevation: 4.0,
        child: ListTile(
          leading: Icon(Icons.arrow_right),
          title: Text(listItems.elementAt(index).path),
          onTap: () {
            showSnackBar(context, listItems.elementAt(index).path);
          },
        ),
      );
    });
  }
}
