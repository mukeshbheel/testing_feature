import 'package:flutter/material.dart';

import '../utils/code_text.dart';
import '../utils/common_widget_classes.dart';
import '../utils/constants.dart';

class OvalShadow extends StatelessWidget {
  const OvalShadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Oval Shadow',
          style: googleFontStyle(color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 20,
              ),
              Text(
                'Container with oval radius',
                style:
                    googleFontStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 50,
              ),
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
                          BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              spreadRadius: 3,
                              blurRadius: 10)
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
              const SizedBox(
                height: 20,
              ),
              const CommonShowCode(
                codeText: CodeText.overShadowCode,
              )
            ],
          ),
        ),
      ),
    );
  }
}
