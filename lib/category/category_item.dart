import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/model/category.dart';

class CategoryItem extends StatelessWidget {
 Categorii category ;
 int index;
 CategoryItem({required this.category, required this.index});
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
         color: category.color
             ,borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
             topRight:Radius.circular(20) ,
         bottomLeft: Radius.circular(
           index % 2 == 0 ? 20:0
         ),
         bottomRight: Radius.circular(
             index % 2 != 0 ? 20:0
         ),
       )
       ),
      child: Column(
        children: [
        SizedBox(height: MediaQuery.of(context).size.height*0.04,)
        ,Expanded(child: Image.asset(category.imagePath))
          ,SizedBox(height: MediaQuery.of(context).size.height*0.01,)
          ,Expanded(child: Text(category.title,style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.whiteColor),))
        ],
      ),
    );
  }
}
