import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flute_music_player/flute_music_player.dart';
import './bloc.dart';


class MusicplayerBloc extends Bloc<MusicplayerEvent, MusicplayerState> {
  @override
  MusicplayerState get initialState => InitialMusicplayerState();

  MusicFinder audioPlayer = MusicFinder();

  @override
  Stream<MusicplayerState> mapEventToState(
    MusicplayerEvent event,
  ) async* {
    if (event is AppStarted) {
      yield ListLoading();
      yield ListLoaded(MusicFinder.allSongs());    
    }
  }
}



// Future<List<FileSystemEntity>> getMusicFiles() async {
//   bool x = await SimplePermissions.checkPermission(Permission.ReadExternalStorage);
//   bool y = await SimplePermissions.checkPermission(Permission.WriteExternalStorage);
//   if(!y) SimplePermissions.requestPermission(Permission.WriteExternalStorage);
//   if(!x) SimplePermissions.requestPermission(Permission.ReadExternalStorage);
//  {
//   Directory extDir = Directory('storage/emulated/0/');
//   List<FileSystemEntity> _files;
//   _files = extDir.listSync(recursive: true, followLinks: false);
//   List<FileSystemEntity> _songs = new List();
//   for(FileSystemEntity x in _files) {
//     if(x.path.endsWith(".mp3")) _songs.add(x); 
//   }
//   return _songs;
//   }
// }