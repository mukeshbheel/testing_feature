import 'package:flutter/material.dart';
import 'package:testing/utils/constants.dart';

import 'home_page.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 50, // Adjust width as needed
            color: Colors.blue,
            child: Center(
              child: Text(
                'Fixed Container',
                style: googleFontStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(child: Navigator(
            onGenerateRoute: (RouteSettings settings) {
              return MaterialPageRoute(
                builder: (context) => HomePage(),
              );
            },
          ),)
        ],
      ),
    );
  }
}

