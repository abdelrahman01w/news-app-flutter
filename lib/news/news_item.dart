import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';

import '../model/news_responce.dart';
import 'package:cached_network_image/cached_network_image.dart';

class NewsItem extends StatelessWidget {
  News news;
  NewsItem({required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: news.urlToImage??"",
                placeholder: (context, url) => Center(child: CircularProgressIndicator(
                  color: AppColors.primaryLightColor,)),
                errorWidget: (context, url, error) => Icon(Icons.error),
              ),
            )
            ,Center(child: Text(news.author??'' , style: Theme.of(context).textTheme.titleSmall?.copyWith(color: AppColors.greyColor),)),
            SizedBox(height:MediaQuery.of(context).size.height*0.02),
            Text(news.title??'' , style: Theme.of(context).textTheme.titleMedium?.copyWith(color: AppColors.blackColor),),
            SizedBox(height:MediaQuery.of(context).size.height*0.02),
            Text(news.publishedAt??'' , style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppColors.greyColor)),
          ],
        ),
      ),
    );
  }
}
