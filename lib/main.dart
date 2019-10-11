import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:music_player2/bloc/bloc.dart';
import 'package:music_player2/bloc/musicplayer_bloc.dart';
import './screens/Home_Page.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          builder: (context) => MusicplayerBloc(),
          child: BlocBuilder<MusicplayerBloc, MusicplayerState>(
            builder: (context, state) {
              if (state is InitialMusicplayerState) {
                return InitialWidget();
              }
              if (state is ListLoading) {
                return Center(child: CircularProgressIndicator());
              }
              if (state is ListLoaded) {
                return ListScreen(state.songs);
              }
              if(state is SongActionState) {
                // Navigator.push(context, MaterialPageRoute(builder: (context) => PlayPage()));
                return PlayPage();
              }
              return Container(child: Center(child: Text("lol fucked")));
            },
          )),
    );
  }
}

class InitialWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MusicplayerBloc bloc = BlocProvider.of<MusicplayerBloc>(context);
    bloc.dispatch(AppStarted());
    return null;
  }
}
