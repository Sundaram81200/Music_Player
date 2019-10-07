import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_permissions/simple_permissions.dart';
import './bloc.dart';
// import 'package:simple_permissions/simple_permissions.dart';


class MusicplayerBloc extends Bloc<MusicplayerEvent, MusicplayerState> {
  @override
  MusicplayerState get initialState => InitialMusicplayerState();

  @override
  Stream<MusicplayerState> mapEventToState(
    MusicplayerEvent event,
  ) async* {
    if (event is AppStarted) {
      yield ListLoading();
      List<FileSystemEntity> _songs = await getMusicFiles();
      yield ListLoaded(_songs);      
    }
  }
}

Future<List<FileSystemEntity>> getMusicFiles() async {
  bool x = await SimplePermissions.checkPermission(Permission.ReadExternalStorage);
  bool y = await SimplePermissions.checkPermission(Permission.WriteExternalStorage);
  if(!y) SimplePermissions.requestPermission(Permission.WriteExternalStorage);
  if(!x) SimplePermissions.requestPermission(Permission.ReadExternalStorage);
 {
  Directory extDir = await getExternalStorageDirectory();
  List<FileSystemEntity> _files;
  _files = extDir.listSync(recursive: true, followLinks: false);
  List<FileSystemEntity> _songs = new List();
  for(FileSystemEntity x in _files) {
    if(x.path.contains(".mp3")) _songs.add(x); 
  }
  return _songs;
  }
}



  
