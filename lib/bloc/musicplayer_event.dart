import 'package:equatable/equatable.dart';

abstract class MusicplayerEvent extends Equatable {
  const MusicplayerEvent();
}

class AppStarted extends MusicplayerEvent {
  @override
  List<Object> get props => null;
}

class SongAction extends MusicplayerEvent {
  @override
  List<Object> get props => null;

  final String songPath;

  SongAction(this.songPath);
}
