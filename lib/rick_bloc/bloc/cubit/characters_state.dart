part of 'characters_cubit.dart';

abstract class CharactersState {}

class CharactersInitial extends CharactersState {}

class CharactersLoded extends CharactersState {
  final List<Character> characters;

  CharactersLoded(this.characters);
}

class LocationLoded extends CharactersState {
  final List<Character> location;

  LocationLoded(this.location);
}
