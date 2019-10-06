import 'dart:io';

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
  final List<FileSystemEntity> songs;

  ListLoaded(this.songs);

  @override
  List<Object> get props => songs;
}
