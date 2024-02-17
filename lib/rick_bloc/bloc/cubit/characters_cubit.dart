import 'package:bloc/bloc.dart';
import 'package:rick_and_morty/data/models/characters.dart';
import 'package:rick_and_morty/data/repository/characters_repo.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  final CharactersRepo charactersRepo;
  List<Character> characters = [];

  CharactersCubit(this.charactersRepo) : super(CharactersInitial());
  List<Character> getAllCharacters() {
    charactersRepo.getAllCaracters().then((characters) {
      emit(CharactersLoded(characters));
      this.characters = characters;
    });
    return characters;
  }

  void getLocation(int id) {
    charactersRepo.getAllCaracters().then((location) {
      emit(LocationLoded(location));
    });
  }
}
