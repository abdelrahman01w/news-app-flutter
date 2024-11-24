import 'package:flutter/material.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/news/news_widget.dart';
import 'package:news_app/tabs/tab_item.dart';

class TabWidget extends StatefulWidget {
  List<Sources> SourceList;

  TabWidget({required this.SourceList});

  @override
  State<TabWidget> createState() => _TabWidgetState();
}

class _TabWidgetState extends State<TabWidget> {
  int selectedIndex=0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: widget.SourceList.length, child: Column(
      children: [
        TabBar(
          onTap: (index){
            selectedIndex=index;
            setState(() {
              
            });
          },
            isScrollable:true
            ,indicatorColor: Colors.transparent,
          tabs:widget.SourceList.map((Sources) => TabItem(
              source: Sources,
              isSelected: selectedIndex==widget.SourceList.indexOf(Sources ),
              )).toList()),
        Expanded(child: NewsWidget(source: widget.SourceList[selectedIndex],))
      ],
    ));
  }
}
