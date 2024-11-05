import 'dart:convert';

class GetYouTubePost{
  String getYouTubePosts(){
    return '''
    [
      {
        "title": "What is Flutter",
        "description": "About flutter"
      },
      {
        "title": "What is Widgets in flutter",
        "description": "all about widgets"
      }
    ]
    ''';
  }
}

class GetInstaPost{
  String getInstaPost(){
    return '''
    [
      {
        "heading": "What is flutter used for?",
        "subHeading": "flutter uses"
      },
      {
        "heading": "Design pattern in flutter",
        "subHeading": "design patterns"
      }
    ]
    ''';
  }
}

abstract class GetPost{
  List<Post> getPost();
}

class GetYouTubePostAdapter implements GetPost{

  final GetYouTubePost getYouTubePost = GetYouTubePost();

  @override
  List<Post> getPost() {
    final data = jsonDecode(getYouTubePost.getYouTubePosts()) as List;
    return data.map((e) => Post(e['title'], e['description'], PostSource.youtube)).toList();
  }

}

class GetInstaPostAdapter implements GetPost{

  final GetInstaPost getInstaPost = GetInstaPost();

  @override
  List<Post> getPost() {
    final data = jsonDecode(getInstaPost.getInstaPost()) as List;
    return data.map((e) => Post(e['heading'], e['subHeading'], PostSource.instagram)).toList();
  }

}

class GetAllPosts implements GetPost{
  final GetInstaPostAdapter getInstaPostAdapter = GetInstaPostAdapter();
  final GetYouTubePostAdapter getYouTubePostAdapter = GetYouTubePostAdapter();
  @override
  List<Post> getPost() {
    return getYouTubePostAdapter.getPost() + getInstaPostAdapter.getPost();
  }

}

class Post {
  String title;
  String subTitle;
  PostSource source;

  Post(this.title, this.subTitle, this.source);
}

enum PostSource  {youtube, instagram}