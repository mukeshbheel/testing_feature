
import 'package:flutter/material.dart';
import 'package:testing/utils/code_text.dart';
import 'package:testing/utils/common_images.dart';
import '../../../utils/common_widget_classes.dart';
import '../../../utils/constants.dart';
import 'adapter_DP.dart';

class AdapterDpExample extends StatelessWidget {
  AdapterDpExample({super.key});
  final getAllPosts = GetAllPosts();

  List points = [
    "Convert the interface of a class into another interface clients expect. Adapter lets classes work together that couldn’t otherwise because of incompatible interfaces.",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Adapter',
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
            const SizedBox(height: 30,),
            ListView.separated(shrinkWrap: true, physics: const NeverScrollableScrollPhysics(), itemBuilder: (context, i){
              Post post = getAllPosts.getPost()[i];
              return postComponent(post);
            }, separatorBuilder: (context, i)=> const SizedBox(height: 10,), itemCount: getAllPosts.getPost().length),
            const SizedBox(height: 30,),
            const CommonShowCode(codeText: CodeText.adapterDPCode,),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }
}

Widget postComponent(Post post){
  return ListTile(
    leading: Image.asset(getImage(post.source), width: 50, height: 50,),
    title: Text(post.title, style: googleFontStyle(),),
    subtitle: Text(post.subTitle),
  );
}

String getImage(PostSource source){
  switch(source){
    case PostSource.youtube:
      return CommonImages.youtubeIcon;
    case PostSource.instagram:
      return CommonImages.instaIcon;
    default:
      return CommonImages.youtubeIcon;
  }
}

