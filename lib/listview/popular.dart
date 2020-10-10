import 'package:flutter/material.dart';

class PopularList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          MyPopularList(
            img_poster: "images/dilan.jpeg",
          ),
          MyPopularList(
            img_poster: "images/dora.jpg",
          ),
          MyPopularList(
            img_poster: "images/monster_hunter.jpg",
          ),
          MyPopularList(
            img_poster: "images/cars.jpg",
          ),
          MyPopularList(
            img_poster: "images/cars_3.jpg",
          ),
          MyPopularList(
            img_poster: "images/httyd_2.jpg",
          ),
        ],
      ),
    );
  }
}

class MyPopularList extends StatelessWidget {
  final String img_poster;
  final String img_title;

  MyPopularList({this.img_poster, this.img_title});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: InkWell(
        onTap: () {},
        child: ListTile(
          title: Image.asset(
            img_poster,
            height: 140,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
