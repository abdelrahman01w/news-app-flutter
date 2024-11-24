import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app/model/api_constant.dart';
import 'package:news_app/model/news_responce.dart';
import 'package:news_app/model/source_response.dart';
class ApiManager{
  //https://newsapi.org/v2/top-headlines/sources?apiKey=64e4eec66502400b8fc4719e60c961ea
  static Future<SourceResponse?> getSources ()async{
    Uri url=Uri.https(ApiConstant.baseUrl,ApiConstant.sourceApi,{
      'apiKey':'64e4eec66502400b8fc4719e60c961ea'
    }); /// customize for http.get(url);
    var response = await http.get(url);
  try{
    var responceBody = response.body;
    var json = jsonDecode(responceBody); /// jsonDecode() : convert from string to json
    return SourceResponse.fromJson(json);     /// fromJson : convert from json to object
  }catch(e){
    throw e ; /// we wrote 'throw e' because we will deal with the error in UI
  }
  }
  //https://newsapi.org/v2/everything?q=bitcoin&apiKey=64e4eec66502400b8fc4719e60c961ea
  static Future<NewsResponce?> GetNewsBySourceId(String sourceId)async{
    Uri url =Uri.https(ApiConstant.baseUrlNews,ApiConstant.newsApi,{
      'apiKey' : '64e4eec66502400b8fc4719e60c961ea',
      'sources' : sourceId
    });
    var response = await http.get(url);
    try{
      var responseBody = response.body;
      var json =jsonDecode(responseBody);
      return NewsResponce.fromJson(json);
    }catch(e){
      throw e;
    }
  }
}
