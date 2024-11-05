import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DynamicComponents extends StatefulWidget {
  DynamicComponents({super.key});

  @override
  State<DynamicComponents> createState() => _DynamicComponentsState();
}

class _DynamicComponentsState extends State<DynamicComponents> {
  List components = [
    {
      "type" : 2,
    },
    {
      "type" : 1,
    },
    {
      "type" : 2,
    },
    {
      "type" : 46,
    },
    {
      "type" : 46,
    },
    {
      "type" : 1,
    },

    {
      "type" : 1,
    },
  ];

  Widget getDynamicComponent(component){
    switch(component['type']){
      case 1:
        return Container(
          height: 20,
          color: Colors.blue,
        );
      default:
        return Checkbox(value: true, onChanged: (v){});
    }
  }

  Widget rowWithTextFields({required int startIndex, required int endIndex}){

    List textFieldsDataList = [];
    for(int i = startIndex; i<= endIndex; i++){
      textFieldsDataList.add(components[i]);
    }

    return Row(
    children: [
      ...textFieldsDataList.map((e)=>Expanded(child: TextFormField(
        decoration: InputDecoration(border: OutlineInputBorder()),
      ))).toList()
    ],
    );
  }

  bool skipNext = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic Components"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        color: Color(0xffFAE1E1FF).withOpacity(0.5),
        child: Column(
          children: [
            ListView.separated(shrinkWrap: true,itemBuilder: (context, i){
              if(skipNext){
                // setState(() {
                  skipNext = false;
                // });
                return SizedBox();
              }else{
                if(components[i]['type'] == 46){
                  if(i!= components.length-1 && components[i+1]['type'] == 46){
                    // setState(() {
                      skipNext = true;
                    // });
                    return rowWithTextFields(startIndex: i, endIndex: i+1);
                  }else{
                    return rowWithTextFields(startIndex: i, endIndex: i);
                  }
                }else{
                  return getDynamicComponent(components[i]);
                }
              }

            }, separatorBuilder: (context, i)=> skipNext ? SizedBox() : SizedBox(height: 20,), itemCount: components.length,),
          ],
        ),
      ),
    );
  }
}
