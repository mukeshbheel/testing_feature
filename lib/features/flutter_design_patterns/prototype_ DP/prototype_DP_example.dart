
import 'package:flutter/material.dart';
import 'package:testing/features/flutter_design_patterns/prototype_%20DP/prototype_DP.dart';
import 'package:testing/utils/code_text.dart';
import '../../../utils/common_widget_classes.dart';
import '../../../utils/constants.dart';

class PrototypeDpExample extends StatefulWidget {
  PrototypeDpExample({super.key});

  @override
  State<PrototypeDpExample> createState() => _PrototypeDpExampleState();
}

class _PrototypeDpExampleState extends State<PrototypeDpExample> {
  List points = [
    "Specify the kinds of objects to create using a prototypical instance, and create new objects by copying this prototype.",
  ];

  Person personPrototype = Person(name: "Test Name", age: 10, country: "India");
  List<Person> persons = [];

  addNewPerson(){
    Person newPerson = personPrototype.clone();
    setState(() {
      persons.add(newPerson);
    });
  }

  refresh(){
    setState(() {});
  }

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
            const SizedBox(height: 20,),
            ListView.separated(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemBuilder: (context, i)=>personComponent(persons[i], context, refresh), separatorBuilder: (context, i)=> const SizedBox(height: 10,), itemCount: persons.length),
            const SizedBox(height: 30,),
            ElevatedButton(onPressed: (){
              addNewPerson();
            }, child: const Text('Add New Person')),
            const SizedBox(height: 30,),
            const CommonShowCode(codeText: CodeText.prototypeDPCode,),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

Widget personComponent(Person person, BuildContext context, VoidCallback refresh){
  return ListTile(
    leading: const Icon(Icons.person, color: Colors.blue,),
    title: Text(person.name, style: googleFontStyle(),),
    subtitle: Text("${person.age} - ${person.country}"),
    trailing: IconButton(icon: const Icon(Icons.edit), onPressed: (){
      showDialog(context: context, builder: (_){
        final nameField = TextEditingController();
        return AlertDialog(
          title: Text("Change Name", style: googleFontStyle(),),
          content: Column(
            children: [
              TextFormField(
                controller: nameField,
              )
            ],
          ),
          actions: [
            ElevatedButton(onPressed: (){
              if(nameField.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red,content: Text("Enter Name", style: googleFontStyle(color: Colors.white),),));
                return;
              }
              person.setter(name: nameField.text);
              Navigator.pop(context);
              refresh();
            }, child: Text("OK", style: googleFontStyle(),)),
            ElevatedButton(onPressed: (){
              Navigator.pop(context);
            }, child: Text("Cancel", style: googleFontStyle(),)),
          ],
        );
      });
    },),
  );
}
