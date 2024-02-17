import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/data/models/characters.dart';
import 'package:rick_and_morty/data/models/location.dart';
import 'package:rick_and_morty/data/repository/characters_repo.dart';
import 'package:rick_and_morty/data/web_ser/web_services.dart';
import 'package:rick_and_morty/rick_bloc/bloc/cubit/characters_cubit.dart';
import 'core/constants/apis.dart';
import 'presentation/view/character/CharactersDetailsView.dart';
import 'presentation/view/character/characters_view.dart';

class AppRouter {
  late CharactersCubit charactersCubit;
  late CharactersRepo charactersRepo;

  AppRouter() {
    charactersRepo = CharactersRepo(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepo);
  }
  // ignore: body_might_complete_normally_nullable
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case CharactersView:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (BuildContext context) => charactersCubit,
            child: AllCharactersView(),
          ),
        );

      case charactersDetailsView:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => charactersCubit,
                  child: CharactersDetailsView(
                    character: character,
                  ),
                ));
    }
  }
}
