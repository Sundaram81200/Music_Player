import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
 class Play_Page extends StatefulWidget {
   @override
   _Play_PageState createState() => _Play_PageState();
 }
 
 class _Play_PageState extends State<Play_Page> {

   @override
   Widget build(BuildContext context) {
     var textColor = Color.fromRGBO(250, 250, 250, 0.95);
     var textStyle = TextStyle(fontFamily: 'Montserrat', color: textColor);
     SystemChrome.setEnabledSystemUIOverlays([]);
     return Scaffold(
       body: Container(
         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
         decoration: BoxDecoration(
           gradient: LinearGradient(
             begin: Alignment.topRight,
             end: Alignment.bottomLeft,
             stops: [0.05, 0.35, 0.95],
             colors: <Color>[
               Color.fromRGBO(30, 30, 30, 1),
               Color.fromRGBO(45, 45, 45, 1),
               Color.fromRGBO(15, 15, 15, 1),
             ],
             tileMode: TileMode.clamp,
           ),
         ),
         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.start,
             children: <Widget>[
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   InkWell(
                     onTap:() {Navigator.pop(context);},

                       child: Icon(Icons.keyboard_arrow_left,
                       color: Colors.white54, size: 24),

                   ),

                   Text(
                     'Singer',
                     style: textStyle.merge(TextStyle(fontSize: 20,fontFamily: 'Montserrat',
                     fontWeight: FontWeight.bold,
                     )),
                   ),
                   SizedBox(width: 14.0,),
                 ],
               ),
               SizedBox(height: 40),
               SizedBox(width: 320, child: Image.asset('assets/photo.jpg')),
               SizedBox(height: 15),
               Text('Song Name',
                   style: textStyle.merge(TextStyle(fontSize: 24))),
               SizedBox(height: 10),
               Text('Singer/Band name',
                   style: textStyle
                       .merge(TextStyle(fontSize: 18, color: Colors.white54))),
               SizedBox(height: 64),
               Slider(
                 onChanged: (double value){
                   setState(() {

                   });
                 },
                 min: 0.0,
                // max: variable that stores the max length of the song,
                 value: 0.2,
                 activeColor: Colors.red,
               ),
               SizedBox(height: 5),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Text(
                     '0:00',
                     style: TextStyle(
                         fontSize: 13,
                         color: Colors.grey,
                   ),
                   ),
                   Text(
                     'song time',
                     style: TextStyle(
                       fontSize: 13,
                       color: Colors.grey,
                     ),
                     ),
                 ],
               ),
               SizedBox(height: 20),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   InkWell(
                     child: Icon(
                       Icons.favorite_border,
                       color: Colors.white54,
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
                       color: textColor,
                       size: 50,
                     ),
                     onTap: (){},
                   ),
                  InkWell(
                    child:  Icon(
                      Icons.do_not_disturb,
                      color: Colors.white54,
                    ),
                  ),
                 ],
               ),
               SizedBox(height: 40),
             ],
           ),
         ),
       ),
     );
   }
 }
 