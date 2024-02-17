import 'package:flutter/material.dart';
import 'package:rick_and_morty/core/recourses/color%20manager/color%20manager.dart';
import 'package:rick_and_morty/core/recourses/styles%20manger/styles%20manager.dart';
import 'package:rick_and_morty/core/recourses/value%20manger/value%20manager.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({
    Key? key,
    required this.width,
    required this.height,
  }) : super(key: key);

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.only(
        end: width * .16,
        start: width * .16,
        top: height * .053,
        bottom: height * .01,
      ),
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              child: TextField(
                maxLines: 1,
                textAlign: TextAlign.start,
                cursorColor: MyColors.primary1,
                decoration: InputDecoration(
                  prefixIcon: IconButton(
                    onPressed: () async {},
                    icon: Icon(
                      Icons.search,
                      color: MyColors.gray4,
                    ),
                  ),
                  hintText: 'ما الذي تبحث عنه ؟',
                  alignLabelWithHint: true,
                  hintStyle: getRegularStyle(
                    color: MyColors.gray5,
                    fontSize: AppSize.s12,
                  ),
                  contentPadding:
                      EdgeInsetsDirectional.symmetric(vertical: height * .001),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          IconButton(
            onPressed: () {
              // Add your filter icon onPressed logic here
            },
            icon: Icon(
              Icons.tune_rounded, // Change this to the desired filter icon
              color: MyColors.gray4,
            ),
          ),
        ],
      ),
    );
  }
}
