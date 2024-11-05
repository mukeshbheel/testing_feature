
import 'package:flutter/material.dart';
import 'package:testing/features/flutter_design_patterns/singleton_DP/singleton_DP.dart';
import 'package:testing/utils/code_text.dart';
import '../../../utils/common_widget_classes.dart';
import '../../../utils/constants.dart';

class SingleDpExample extends StatefulWidget {
  SingleDpExample({super.key});

  @override
  State<SingleDpExample> createState() => _SingleDpExampleState();
}

class _SingleDpExampleState extends State<SingleDpExample> {
  List points = [
    "Singleton is a creational design pattern that ensures that a class has only one instance and also provides a global point of access to it.",
  ];

  late EmployeeSingleton employee1 = EmployeeSingleton();

  late EmployeeSingleton employee2 = EmployeeSingleton();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Singleton',
          style: googleFontStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 20,),
            ListView.separated(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemBuilder: (context, i)=>pointItem(point: points[i]), separatorBuilder: (context, i)=> const SizedBox(height: 10,), itemCount: points.length),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: MediaQuery.of(context).size.width,
              height: 400,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Center(
                child: Row(
                  children: [
                    Expanded(child: component1(employee1, (){
                      setState(() {});
                    })),
                    const SizedBox(height: 20,),
                    Expanded(child: component1(employee2,(){
                    setState(() {});
                    })),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30,),
            const CommonShowCode(codeText: CodeText.singletonDPCode,),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

Widget component1(EmployeeSingleton employee, VoidCallback onPressed){
  return Container(
    decoration: BoxDecoration(
      border: Border.all(color: Colors.black, width: 3)
    ),
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Employee name : ${employee.name}", style: googleFontStyle(),),
          const SizedBox(height: 20,),
          ElevatedButton(onPressed: (){
            if(employee.name == "Chintu"){
              employee.name = "Pintu";
            }else{
              employee.name = "Chintu";
            }
            onPressed();
          }, child: const Text('Change Name'))
        ],
      ),
    ),
  );
}
