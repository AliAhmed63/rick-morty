import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_and_morty/core/recourses/color%20manager/color%20manager.dart';
import 'package:rick_and_morty/core/recourses/styles%20manger/styles%20manager.dart';
import 'package:rick_and_morty/data/models/characters.dart';
import 'package:rick_and_morty/data/models/location.dart';
import 'package:rick_and_morty/rick_bloc/bloc/cubit/characters_cubit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class CharactersDetailsView extends StatefulWidget {
  final Character character;
  const CharactersDetailsView({
    super.key,
    required this.character,
  });

  @override
  State<CharactersDetailsView> createState() => _CharactersDetailsViewState();
}

class _CharactersDetailsViewState extends State<CharactersDetailsView> {
  Widget characterInfo(String title, String value, int maxLine) {
    return RichText(
      maxLines: maxLine,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: getBoldStyle(color: MyColors.primary1, fontSize: 28)
                .copyWith(shadows: [
              const Shadow(
                offset: Offset(1.5, 1.5),
                blurRadius: 2.0,
                color: Color.fromARGB(255, 0, 0, 0),
              )
            ]),
          ),
          TextSpan(
            text: value,
            style: getMediumStyle(color: MyColors.primary3, fontSize: 26)
                .copyWith(shadows: [
              const Shadow(
                offset: Offset(1, 1),
                blurRadius: 2.0,
                color: Color.fromARGB(255, 0, 0, 0),
              )
            ]),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget _buildSliverAppBar(context) {
    return SliverAppBar(
      expandedHeight: 500,
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back,
          color: MyColors.primary1,
          size: 30,
        ),
      ),
      pinned: true,
      stretch: true,
      backgroundColor: MyColors.white,
      flexibleSpace: LayoutBuilder(
        builder: (context, constraints) {
          return FlexibleSpaceBar(
            titlePadding: EdgeInsets.zero,
            title: Padding(
              padding: const EdgeInsetsDirectional.only(
                  start: 70.0, bottom: 12, end: 20),
              child: Text(
                widget.character.name,
                style: getBoldStyle(color: MyColors.primary1, fontSize: 22)
                    .copyWith(shadows: [
                  const Shadow(
                    offset: Offset(2, 2),
                    blurRadius: 2.0,
                    color: Color.fromARGB(255, 0, 0, 0),
                  )
                ]),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
            background: Hero(
              tag: widget.character.id,
              child: Image.network(
                widget.character.image,
                fit: BoxFit.fill,
              ),
            ),
          );
        },
      ),
    );
  }

  Widget buildDivider(
    double end,
  ) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 6.0, top: 4),
      child: Divider(
        color: MyColors.primary1,
        height: 10,
        endIndent: end,
        thickness: 1.3,
      ),
    );
  }

  Widget checkIfLocationAreLoding(CharactersState state) {
    if (state is CharactersLoded) {
      return displayRandomLocationOrEmpty(state);
    } else {
      return showProgressIndicator();
    }
  }

  Widget showProgressIndicator() {
    return CircularProgressIndicator();
  }

  Widget displayRandomLocationOrEmpty(state) {
    var caracter = (state).characters;
    if (caracter != null) {
      return Center(
          child: DefaultTextStyle(
        textAlign: TextAlign.center,
        style: getBoldStyle(fontSize: 24, color: MyColors.primary2)
            .copyWith(shadows: [
          const Shadow(
            offset: Offset(1.5, 1.5),
            blurRadius: 2.0,
            color: Color.fromARGB(255, 0, 0, 0),
          )
        ]),
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            FlickerAnimatedText(widget.character.location),
          ],
        ),
      ));
    } else {
      return Container(
        color: MyColors.black1,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      body: CustomScrollView(
        slivers: [
          _buildSliverAppBar(context),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: MyColors.primary1,
                      width: 4,
                    ),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      characterInfo('Species: ', widget.character.species, 1),
                      buildDivider(290),
                      characterInfo('State: ', widget.character.status, 1),
                      buildDivider(305),
                      characterInfo('Origin: ', widget.character.origin, 1),
                      buildDivider(295),
                      characterInfo('Location: ', widget.character.location, 1),
                      buildDivider(265),
                      characterInfo('created: ', widget.character.creeated, 1),
                      buildDivider(285),
                      characterInfo('Type: ', widget.character.type, 1),
                      buildDivider(290),
                      SizedBox(
                        height: 40,
                      ),
                      BlocBuilder<CharactersCubit, CharactersState>(
                          builder: (context, state) {
                        return checkIfLocationAreLoding(state);
                      }),
                      SizedBox(
                        height: 400,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
