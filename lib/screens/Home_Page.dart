import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player2/bloc/bloc.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import 'Play_Page.dart';

class ListScreen extends StatefulWidget {
  final List<dynamic> listItems;

  ListScreen(this.listItems);

  @override
  State<StatefulWidget> createState() {
    return _ListScreenState(listItems);
  }
}

class _ListScreenState extends State<ListScreen> {
  final List<dynamic> listItems;
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
                  image: AssetImage('assets/Back.jpg'),
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
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      color: Colors.white70,
                    ),
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
            SlidingUpPanel(
              backdropOpacity: 1,
              maxHeight: MediaQuery.of(context).size.height,
              panel: PlayPage(),
              collapsed: Container(
                color: Colors.black45,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    InkWell(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.white54,
                          ),
                        ),
                        onTap: () {}),
                    InkWell(
                      child: Icon(
                        Icons.skip_previous,
                        color: Colors.white,
                        size: 50,
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Icon(
                        Icons.play_circle_filled,
                        color: Colors.white70,
                        size: 70,
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: Icon(
                        Icons.skip_next,
                        color: Colors.white,
                        size: 50,
                      ),
                      onTap: () {},
                    ),
                    SizedBox(
                      width: 35.0,
                    )
                  ],
                ),
              ),
              body: Container(),
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
  );
  Scaffold.of(context).showSnackBar(snackBar);
}

class GetListView extends StatefulWidget {
  final List<dynamic> listItems;
  GetListView(this.listItems);

  @override
  State<StatefulWidget> createState() {
    return _GetListViewState(listItems);
  }
}

class _GetListViewState extends State<GetListView> {
  MusicplayerBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = BlocProvider.of<MusicplayerBloc>(context);
  }

  final List<dynamic> listItems;
  _GetListViewState(this.listItems);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Card(
<<<<<<< HEAD
        color: Colors.transparent,
        elevation: 4.0,
        child: ListTile(
          leading: Icon(Icons.album),
          title: Text(
            listItems.elementAt(index).uri,
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Montserrat',
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.normal,
            ),
          ),
          onTap: () {
            showSnackBar(context, listItems.elementAt(index).uri);
            bloc.dispatch(SongAction(listItems.elementAt(index).uri));
          },
        ),
      );
=======

          color: Colors.transparent,
          elevation: 0.0,
          child: ListTile(
            leading: Icon(Icons.album),
            title: Text(
              listItems.elementAt(index).uri,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.normal,
              ),
            ),
            onTap: () {
              showSnackBar(context, listItems.elementAt(index).uri);
              bloc.dispatch(SongAction(listItems.elementAt(index).uri));
            },
          ),
        );
      

>>>>>>> ece0949c80ed635db38d2fbc58a4d37298324981
    });
  }
}

String songName(String string) {
  return "";
}
