import 'package:rick_and_morty/data/models/characters.dart';
import 'package:rick_and_morty/data/models/location.dart';
import 'package:rick_and_morty/data/web_ser/web_services.dart';

class CharactersRepo {
  final CharactersWebServices charactersWebServices;

  CharactersRepo(this.charactersWebServices);

  Future<List<Character>> getAllCaracters() async {
    final List<Character> characters =
        await charactersWebServices.getAllCaracters();

    return characters;
  }

  Future<List<Location>> getCaracterLocations(int id) async {
    final List<Location> location =
        await charactersWebServices.getCharacterLocations(id);

    return location;
  }
}
