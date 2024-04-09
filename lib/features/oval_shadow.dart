import 'package:flutter/material.dart';

class OvalShadow extends StatelessWidget {
  const OvalShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Container with oval radius', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
            SizedBox(height: 50,),

            Stack(
              children: [
                SizedBox(
                  width: 320,
                  child: Container(
                    margin: EdgeInsets.only(bottom: 20),
                    width: 300,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(color: Colors.black.withOpacity(0.1), spreadRadius: 3, blurRadius: 10)
                      ],
                      borderRadius: BorderRadius.vertical(
                          top: Radius.elliptical(
                              MediaQuery.of(context).size.width, 100.0)),
                    ),
                  ),
                ),
                Positioned(
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Container(
                    color: Colors.white,
                    width: 500,
                    height: 50,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
