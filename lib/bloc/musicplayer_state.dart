import 'package:equatable/equatable.dart';

abstract class MusicplayerState extends Equatable {
  const MusicplayerState();
}

class InitialMusicplayerState extends MusicplayerState {
  @override
  List<Object> get props => [];
}

class ListLoading extends MusicplayerState {
  @override
  List<Object> get props => null;
}

class ListLoaded extends MusicplayerState {
  var songs;

  ListLoaded(this.songs);

  @override
  List<Object> get props => songs;
}

class SongActionState extends MusicplayerState {
  final String state;

  SongActionState(this.state);

  @override
  List<Object> get props => [state];
}
