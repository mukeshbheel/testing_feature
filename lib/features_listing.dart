import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testing/features/accordion_page.dart';
import 'package:testing/features/fl_charts.dart';
import 'package:testing/features/mapples_function.dart';
import 'package:testing/features/oval_shadow.dart';

class FeaturesListings extends StatelessWidget {
  FeaturesListings({super.key});

  List features = [
    {
      'title': 'Accordian',
      'screen': AccordionPage()
    },
    {
      'title': 'mapple',
      'screen': MapplesFunction()
    },
    {
      'title': 'fl_charts',
      'screen': FlCharts()
    },
    {
      'title': 'oval shadow',
      'screen': OvalShadow()
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Features'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 20,),
              ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index)=>InkWell(
                  onTap: (){
                    Get.to(features[index]['screen']);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.featured_play_list, size: 20, color: Colors.blue,),
                      SizedBox(width: 20,),
                      Text('${features[index]['title']}', style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600
                      ),)
                    ],
                  ),
                ),
                separatorBuilder: (context, index)=>SizedBox(height: 10,),
                itemCount: features.length,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
