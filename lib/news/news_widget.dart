import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/app_colors.dart';
import 'package:news_app/model/api_manager.dart';
import 'package:news_app/model/news_responce.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/news/news_item.dart';

class NewsWidget extends StatefulWidget {
  Sources source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder <NewsResponce?>  (
        future: ApiManager.GetNewsBySourceId(widget.source.id??""),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(child: CircularProgressIndicator(
              color: AppColors.primaryLightColor,
            ));
    }else if(snapshot.hasError){
            return Column(children: [
              Text('Some thing went wrong'),
              ElevatedButton(onPressed: (){ApiManager.GetNewsBySourceId(widget.source.id??'');
                setState(() {

                });},
                  child: Text("try again"))
            ],);
          }
          if(snapshot.data!.status!!='ok'){
            return Column(children: [
              Text(snapshot.data!.message!),
              ElevatedButton(onPressed: (){ApiManager.GetNewsBySourceId(widget.source.id??'');
                setState(() {

                });},
                  child: Text("try again"))
            ],);
          }
          var newsList=snapshot.data!.articles!;
          return ListView.builder(itemBuilder: (context,index){
            return NewsItem(news: newsList[index],);
          }
          ,itemCount: newsList.length,
          );
    }
    );
  }
}
