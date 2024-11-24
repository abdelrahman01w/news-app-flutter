import 'dart:ui';
import 'package:news_app/app_colors.dart';

class Categorii {
  String id;
  String title;
  String imagePath;
  Color color;
  Categorii({required this.id,required this.title, required this.imagePath , required this.color});
  static List<Categorii>getCatagerious(){
    /* business entertainment
    general health science sports technology */
    return [
      Categorii(id: 'sports', title: "sports", imagePath: 'assets/1x/sports.png', color: AppColors.redColor)
      ,Categorii(id: 'health', title: "health", imagePath: 'assets/1x/health.png', color: AppColors.pinkColor)
      ,Categorii(id: 'science', title: "science", imagePath: 'assets/1x/science.png', color: AppColors.redColor)
      ,Categorii(id: 'business', title: "business", imagePath: 'assets/1x/bussines.png', color: AppColors.darkBlueColor)
    ];
}
}
