import 'package:flutter/material.dart';

class Charactor {
  String name;
  Charactor(this.name);
}

class Machine {
  String name;
  Machine(this.name);
}

mixin FlyFeature on Charactor{
  String fly(){
    return "Flying";
  }
}

mixin SwimFeature{
  ///provides swim functionality to Charactor class
  String swim(){
    return "Swimming";
  }
}

class FlyingPerson extends Charactor with FlyFeature{
  FlyingPerson(super.name);
}

class SwimmingPerson extends Charactor with SwimFeature{
  SwimmingPerson(super.name);
}

class AllFeaturesPerson extends Charactor with FlyFeature, SwimFeature{
  AllFeaturesPerson(super.name);
}

class MixinsExample extends StatelessWidget {
  MixinsExample({super.key});
  final SwimmingPerson swimmingPerson = SwimmingPerson("Rohit");
  final FlyingPerson flyingPerson = FlyingPerson("Raj");
  final AllFeaturesPerson allFeaturesPerson = AllFeaturesPerson("Ranjan");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Person created with mixins', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
            SizedBox(height: 50,),

            Container(
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("${swimmingPerson.name} is ${swimmingPerson.swim()}"),
                    const SizedBox(height: 20,),
                    Text("${flyingPerson.name} is ${flyingPerson.fly()}"),
                    const SizedBox(height: 20,),
                    Text("${allFeaturesPerson.name} is ${allFeaturesPerson.fly()} and ${allFeaturesPerson.swim()}"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
    return Container(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${swimmingPerson.name} is ${swimmingPerson.swim()}"),
            const SizedBox(height: 20,),
            Text("${flyingPerson.name} is ${flyingPerson.fly()}"),
          ],
        ),
      ),
    );
  }
}
