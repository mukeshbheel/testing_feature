import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:testing/utils/common_snackbar.dart';
import 'constants.dart';

class CommonShowCode extends StatefulWidget {
  const CommonShowCode({
    super.key, required this.codeText,
  });

  final String codeText;

  @override
  State<CommonShowCode> createState() => _CommonShowCodeState();
}

class _CommonShowCodeState extends State<CommonShowCode> {
  bool showCode = false;

  toggleShowCode(){
    setState(() {
      showCode = !showCode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: showCode ? 400 : 56,
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black,
          border: Border.all(color: Colors.black)
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            InkWell(
              onTap: toggleShowCode,
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    border: Border.all(color: Colors.black)
                ),
                child: Row(
                  children: [
                    Text("Show Code", style: googleFontStyle(),)
                  ],
                ),
              ),
            ),
            Column(
              children: [
                AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.fastOutSlowIn,
                  child: Container(
                    child: !showCode
                        ? null
                        : FadeTransition(opacity: const AlwaysStoppedAnimation<double>(1), child: Stack(
                          children: [
                            Container(padding: const EdgeInsets.all(16),child: Text(widget.codeText, style: googleFontStyle(color: Colors.white),)),
                            Positioned(
                              top: 10,
                                right: 10,
                                child: InkWell(
                              onTap: () async {
                                try{
                                  await Clipboard.setData(ClipboardData(text: widget.codeText));
                                  CommonSnackbar.showSuccess(context: context, message: "Copied to clipboard");
                                }catch(e){
                                  debugPrint(e.toString());
                                }

                                // copied successfully
                              },
                              child: Icon(Icons.copy, color: Colors.white,),
                            ))
                          ],
                        ),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
