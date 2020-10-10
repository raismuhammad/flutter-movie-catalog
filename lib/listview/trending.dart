import 'package:flutter/material.dart';

class TrendingList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 380,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: ListView(scrollDirection: Axis.horizontal, children: <Widget>[
        MyTrendingList(
          img_poster: "images/hangout.jpg",
          img_title: "Hangout",
        ),
        MyTrendingList(
          img_poster: "images/hababe_dan_ainun.jpg",
          img_title: "Hababe dan Ainun",
        ),
        MyTrendingList(
          img_poster: "images/dunkirk.jpg",
          img_title: "Dunkirk Ware",
        ),
        MyTrendingList(
          img_poster: "images/cek_toko_sebelah.jpg",
          img_title: "Cek Toko Sebelah",
        ),
      ]),
    );
  }
}

class MyTrendingList extends StatelessWidget {
  final String img_poster;
  final String img_title;

  MyTrendingList({this.img_poster, this.img_title});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 230,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: InkWell(
          onTap: () {},
          child: ListTile(
            title: Image.asset(
              img_poster,
              height: 310,
              fit: BoxFit.cover,
            ),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child: Text(img_title,
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 20,
                  )),
            ),
          ),
        ));
  }
}
