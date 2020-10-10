import 'package:movie_catalog/screen/trending.dart';

class DiscoverModel{
  final int id;
  final String title;

  DiscoverModel({this.id, this.title});

  factory DiscoverModel.fromJson(Map<String, dynamic> json) {
    return DiscoverModel(
      id: json['id'] as int,
      title: json['title'] as String,
    );
  }
}