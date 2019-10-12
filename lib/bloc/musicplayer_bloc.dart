import 'dart:async';
import 'package:bloc/bloc.dart';
<<<<<<< HEAD
import 'package:flute_music_player/flute_music_player.dart';
import './bloc.dart';
=======
import './bloc.dart';
import 'package:flute_music_player/flute_music_player.dart';

>>>>>>> ece0949c80ed635db38d2fbc58a4d37298324981

class MusicplayerBloc extends Bloc<MusicplayerEvent, MusicplayerState> {
  @override
  MusicplayerState get initialState => InitialMusicplayerState();

  MusicFinder audioPlayer = MusicFinder();
  String playStatus = "paused";
  @override
  Stream<MusicplayerState> mapEventToState(
    MusicplayerEvent event,
  ) async* {
    if (event is AppStarted) {
      yield ListLoading();
      var _songs = await MusicFinder.allSongs();
      // List<FileSystemEntity> _songs = await getMusicFiles();
      yield ListLoaded(_songs);
    }
    if (event is SongAction) {
      if(playStatus == "paused") {
        String x = await play(audioPlayer,event.songPath);
        yield(SongActionState(x));
      }
      else if(playStatus == "playing") {
        String x = await pause(audioPlayer);
        yield(SongActionState(x));
      }
    }
  }
}

<<<<<<< HEAD
=======

>>>>>>> ece0949c80ed635db38d2fbc58a4d37298324981
// Future<List<FileSystemEntity>> getMusicFiles() async {
//   bool x = await SimplePermissions.checkPermission(Permission.ReadExternalStorage);
//   bool y = await SimplePermissions.checkPermission(Permission.WriteExternalStorage);
//   if(!y) SimplePermissions.requestPermission(Permission.WriteExternalStorage);
//   if(!x) SimplePermissions.requestPermission(Permission.ReadExternalStorage);
//  {
//   Directory extDir = Directory('storage/emulated/0/Music');
//   List<FileSystemEntity> _files;
//   _files = extDir.listSync(recursive: true, followLinks: false);
//   List<FileSystemEntity> _songs = new List();
//   for(FileSystemEntity x in _files) {
//     if(x.path.endsWith(".mp3")) _songs.add(x);
//   }
//   return _songs;
//   }
// }
Future<String> play(MusicFinder audioPlayer,String path) async{
  final result = await audioPlayer.play(path);
  if(result == 1) return "playing"; 
  else return "stopped";
}

Future<String> pause(MusicFinder audioPlayer) async {
  final result = await audioPlayer.pause();
  if(result == 1) return "paused";
  else return "playing";  
<<<<<<< HEAD
}
=======

}
>>>>>>> ece0949c80ed635db38d2fbc58a4d37298324981
