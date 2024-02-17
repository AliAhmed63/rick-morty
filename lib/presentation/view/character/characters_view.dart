import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:rick_and_morty/core/recourses/color%20manager/color%20manager.dart';
import 'package:rick_and_morty/core/recourses/styles%20manger/styles%20manager.dart';
import 'package:rick_and_morty/core/recourses/value%20manger/value%20manager.dart';
import 'package:rick_and_morty/presentation/widgets/character_item.dart';
import 'package:rick_and_morty/rick_bloc/bloc/cubit/characters_cubit.dart';
import '../../../data/models/characters.dart';

class AllCharactersView extends StatefulWidget {
  const AllCharactersView({super.key});

  @override
  State<AllCharactersView> createState() => _AllCharactersViewState();
}

class _AllCharactersViewState extends State<AllCharactersView> {
  late List<Character> allCharacters;
  late List<Character> searchedForCharacters;
  final _searchTextController = TextEditingController();
  bool _isSearching = false;
  Widget _buildSearchField() {
    return TextField(
      controller: _searchTextController,
      maxLines: 1,
      style: getLightStyle(color: MyColors.gray1),
      onChanged: (searchedCharacter) {
        addSearchedForItemsSearchedList(searchedCharacter);
      },
      textAlign: TextAlign.start,
      cursorColor: MyColors.primary1,
      decoration: InputDecoration(
        prefixIcon: IconButton(
          onPressed: () async {},
          icon: Icon(
            Icons.search,
            color: MyColors.primary2,
          ),
        ),
        hintText: 'Finde a Character ..',
        alignLabelWithHint: true,
        hintStyle: getRegularStyle(
          color: MyColors.primary2,
          fontSize: AppSize.s12,
        ),
        contentPadding: EdgeInsetsDirectional.symmetric(
            vertical: MediaQuery.of(context).size.height * .001),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: MyColors.primary2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: MyColors.primary2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide(color: MyColors.primary2),
        ),
      ),
    );
  }

  void addSearchedForItemsSearchedList(String searchedCharacter) {
    searchedForCharacters = allCharacters
        .where((character) =>
            character.name.toLowerCase().startsWith(searchedCharacter))
        .toList();
    setState(() {});
  }

  List<Widget> _buildAppBar() {
    if (_isSearching) {
      return [
        IconButton(
          onPressed: () {
            _clearSerch();
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.clear,
            color: MyColors.primary2,
          ),
        )
      ];
    } else {
      return [
        IconButton(
            onPressed: _startSearch,
            icon: Icon(
              Icons.search,
              color: MyColors.primary2,
            ))
      ];
    }
  }

  void _startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearching));
    setState(() {
      _isSearching = true;
    });
  }

  void _stopSearching() {
    _clearSerch();
    setState(() {
      _isSearching = false;
    });
  }

  void _clearSerch() {
    setState(() {
      _searchTextController.clear();
    });
  }

  @override
  void initState() {
    super.initState();

    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  Widget buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoded) {
          allCharacters = (state).characters;
          return buildloadedlistWidget();
        } else {
          return showLoadingIndicator();
        }
      },
    );
  }

  Widget showLoadingIndicator() {
    return Center(
      child: CircularProgressIndicator(color: MyColors.black1),
    );
  }

  Widget buildloadedlistWidget() {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [MyColors.gray6, MyColors.white],
              begin: Alignment.topCenter),
        ),
        width: double.infinity,
        child: Column(
          children: [
            buildCharactersList(),
          ],
        ),
      ),
    );
  }

  Widget noInternetWidget() {
    return Center(
        child: Column(children: [
      const SizedBox(
        height: 40,
      ),
      Image.asset('assets/images/undraw_bug_fixing_oc7a.png'),
      DefaultTextStyle(
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
            FlickerAnimatedText(
                'Wubba Lubba Dub Dub.\n Do you think that the application works without the Internet? Open the Internet, you idiot'),
          ],
        ),
      )
    ]));
  }

  Widget buildCharactersList() {
    return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2.5 / 3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        itemCount: _searchTextController.text.isEmpty
            ? allCharacters.length
            : searchedForCharacters.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (ctx, index) {
          // return Image.asset('assets/images/rick.jpg');
          return CharacterItem(
            character: _searchTextController.text.isEmpty
                ? allCharacters[index]
                : searchedForCharacters[index],
          );
        });
  }

  Widget _buildAppBarTitel() {
    return Text(
      'Characters',
      style: getBoldStyle(color: MyColors.primary2, fontSize: 28),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: _isSearching
            ? InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back,
                  color: MyColors.primary2,
                ),
              )
            : Padding(
                padding: EdgeInsetsDirectional.only(start: 8),
                child: Image.asset(
                  'assets/images/rick-and-morty-31006.png',
                  fit: BoxFit.cover,
                ),
              ),
        title: _isSearching ? _buildSearchField() : _buildAppBarTitel(),
        centerTitle: true,
        actions: _buildAppBar(),
      ),
      body: OfflineBuilder(
        connectivityBuilder: (
          BuildContext context,
          ConnectivityResult connectivity,
          Widget child,
        ) {
          final bool connected = connectivity != ConnectivityResult.none;
          if (connected) {
            return buildBlocWidget();
          } else {
            return noInternetWidget();
          }
        },
        child: showLoadingIndicator(),
      ),

      //
    );
  }
}
