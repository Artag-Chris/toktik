import 'package:toktik/domain/entities/video_post.dart';

class LocalVideoModel {
  final String name;
  final String videoUrl;
  final int likes;
  final int views;

  LocalVideoModel(
      {required this.name,
      required this.videoUrl,
      this.likes = 0,
      this.views = 0});

  factory LocalVideoModel.fromjson(Map<String, dynamic> json) =>
      LocalVideoModel(
          name: json["name"] ?? "No Video Name",
          videoUrl: json["videoUrl"] ?? "No Url Data",
          likes: json["likes"],
          views: json["views"]);


VideoPost toVideoPostEntity()=> VideoPost(
  caption: name,
  videoUrl: videoUrl,
  likes:likes,
  views: views
);


}
