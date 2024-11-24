import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../app_colors.dart';
import '../model/api_manager.dart';
import '../model/source_response.dart';
import '../tabs/tab_widget.dart';

class CategoryDetails extends StatefulWidget {

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(future:  ApiManager.getSources(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting){ ///snapshot.connectionState==ConnectionState.waiting : in 'loading' level
            return Center(child: CircularProgressIndicator(color: AppColors.primaryLightColor,));
          }else if(snapshot.hasError){ /// snapshot.hasError : client send something error
            return Column(
              children: [
                Text('Some thing went wring')
                , ElevatedButton(onPressed: (){
                  ApiManager.getSources();
                  setState(() {

                  });
                }, child: Text('try again'))
              ],
            );
          }
          if(snapshot.data!.status!='ok'){ /// server response => error
            return Column(
              children: [
                Text(snapshot.data!.message!)
                , ElevatedButton(onPressed: (){
                  ApiManager.getSources();
                  setState(() {

                  });
                }, child: Text('try again'))
              ],
            );
          }
          var sourceList =snapshot.data!.sources!;
          return
            //   ListView.builder(itemBuilder: (context,index){
            //   return Text(sourceList[index].name??"");
            // },itemCount: sourceList.length,)

            TabWidget(SourceList: sourceList,);
        });
  }
}
