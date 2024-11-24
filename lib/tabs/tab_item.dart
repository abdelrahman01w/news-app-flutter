import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/model/source_response.dart';

import '../model/news_responce.dart';

class TabItem extends StatelessWidget {
 bool isSelected;
 Sources source;
 TabItem({required this.isSelected,required this.source});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.all(8),
      child: Container(
        margin: EdgeInsets.only(top: 0),
        decoration: BoxDecoration(
           borderRadius: BorderRadius.circular(20),
          color: isSelected ?AppColors.primaryLightColor : Colors.transparent,
          border: Border.all(color: AppColors.primaryLightColor,
          width: 4)
        ),
        child: Text(
          ' ${source.name ?? ''} ',style: Theme.of(context).textTheme.titleLarge?.
        copyWith(color:isSelected ?
        AppColors.whiteColor :AppColors.primaryLightColor),),
      ),
    );
  }
}
