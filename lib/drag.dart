import 'package:flutter/material.dart';
import 'package:music_player2/screens/Play_Page.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class Drag extends StatefulWidget {
  @override
  _DragState createState() => _DragState();
}

class _DragState extends State<Drag> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlidingUpPanel(
        maxHeight: MediaQuery.of(context).size.height,
        panel: PlayPage(),
        collapsed: Container(
          color: Colors.red,
          child:  Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              InkWell(
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite_border,
                      color: Colors.white54,
                    ),

                  ),
                  onTap: () {}
              ),
              InkWell(
                child: Icon(
                  Icons.skip_previous,
                  color: Colors.white,
                  size: 50,
                ),
                onTap: (){},
              ),
              InkWell(
                child: Icon(
                  Icons.play_circle_filled,
                  color: Colors.white70,
                  size: 70,
                ),
                onTap: (){},
              ),
              InkWell(
                child: Icon(
                  Icons.skip_next,
                  color: Colors.white,
                  size: 50,
                ),
                onTap: (){},
              ),
              SizedBox(width: 35.0,)
            ],
          ),
        ),
        body: Center(
          child: Text("Home Page"),
        ),
      ),
    );
  }
}
