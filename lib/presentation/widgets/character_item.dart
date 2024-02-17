import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/constants/apis.dart';
import 'package:rick_and_morty/core/recourses/color%20manager/color%20manager.dart';
import 'package:rick_and_morty/core/recourses/styles%20manger/styles%20manager.dart';
import 'package:rick_and_morty/core/recourses/value%20manger/value%20manager.dart';
import 'package:rick_and_morty/data/models/characters.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(11, 11, 11, 11),
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: MyColors.primary3,
            offset: Offset(3, 3),
            blurRadius: 9,
          ),
        ],
        color: MyColors.primary3,
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(18.0),
          bottomLeft: Radius.circular(18.0),
        ),
      ),
      child: InkWell(
        onTap: ()=> Navigator.pushNamed(context,charactersDetailsView,arguments: character),
        child: GridTile(
          footer: Hero(
            tag: character.id,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: MyColors.primary3,
              alignment: Alignment.bottomCenter,
              child: Text(
                '${character.name}',
                style:
                    getSemiBoldStyle(color: MyColors.white, fontSize: AppSize.s16)
                        .copyWith(
                  height: 0.8,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(18.0),
              bottomLeft: Radius.circular(60.0),
            ),
            child: Container(
              child: character.image.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      placeholder: 'assets/images/loding.gif',
                      image: character.image,
                      fit: BoxFit.cover,
                    )
                  : Image.asset('assets/images/rick.jpg'),
            ),
          ),
        ),
      ),
    );
  }
}
