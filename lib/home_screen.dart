import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/category/category_details.dart';
import 'package:news_app/category/category_fragment.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'HomeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children:[Container(
      color: AppColors.whiteColor,
        child: Image.asset('assets/1x/pattern.png',width: double.infinity,height: double.infinity,fit: BoxFit.cover,),
      )
        ,Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
           shape: Theme.of(context).appBarTheme.shape,
            title: Text('News App',style: Theme.of(context).textTheme.titleLarge,),
          ),
          body: Category_fragment(),
        )
      ]
    );
  }
}
