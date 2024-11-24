import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';

class MyThemeData{
  static final ThemeData lightTheme=ThemeData(
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primaryLightColor
         , centerTitle: true ,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
                bottomLeft: Radius.circular(30)
        )
      )
    )
        ,textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: AppColors.blackColor
      ),
      titleMedium: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor
      ),
      titleSmall: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.blackColor
      )
  )
  );
}