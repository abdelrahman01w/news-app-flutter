import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/category/category_item.dart';
import 'package:news_app/model/category.dart';

class Category_fragment extends StatelessWidget {
  var categoriesList = Categorii.getCatagerious();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(children: [
        Text('Pick your category\n of interest',style: Theme.of(context).textTheme.titleLarge,),
        Expanded(
          child: GridView.builder(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:2, /// numper of column in 1 row
            mainAxisSpacing: 10,
            crossAxisSpacing: 10
          ),
            itemBuilder: (context,index){
            return CategoryItem(index: index,category: categoriesList[index],);
            },
            itemCount: categoriesList.length,
          ),
        )
      ],),
    );
  }
}
