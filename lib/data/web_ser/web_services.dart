import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:rick_and_morty/core/constants/apis.dart';
import 'package:rick_and_morty/data/models/characters.dart';
import 'package:rick_and_morty/data/models/location.dart';

class CharactersWebServices {
  late Dio dio;

  CharactersWebServices() {
    BaseOptions options = BaseOptions(
      baseUrl: basUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      receiveDataWhenStatusError: true,
    );
    dio = Dio(options);
  }

  Future<List<Character>> getAllCaracters() async {
    try {
      Response response = await dio.get('character');
      print(response.data['results'] as List);
      final List decodedJson = response.data['results'] as List;

      final List<Character> productsModel = decodedJson
          .map<Character>((jsonCartModel) => Character.fromJson(jsonCartModel))
          .toList();
      return productsModel;
    } catch (e) {
      print("test" + e.toString());
      return [];
    }
  }

  Future<List<Location>> getCharacterLocations(int id) async {
    try {
      Response response = await dio.get('location/$id');
      print(response.data['results'] as List);
      final List decodedJson = response.data['results'] as List;
      final List<Location> locationsModel = decodedJson
          .map<Location>((jsonCartModel) => Location.fromJson(jsonCartModel))
          .toList();
      print('lol' + locationsModel.toString());
      return locationsModel;
    } catch (e) {
      print('lol' + e.toString());
      return [];
    }
  }
}
