import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscoverDetail extends StatelessWidget {

  int id;
  String namaFilm;
  String sinopsis;
  double score;
  String poster;
  String release;
  String backPoster;
  DiscoverDetail({this.id, this.namaFilm, this.sinopsis, this.score, this.release, this.poster, this.backPoster});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(namaFilm.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(height: 210, decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(backPoster.toString()))),),
              Container(
                height: 130,
                margin: EdgeInsets.fromLTRB(0, 0, 0, 8),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(width: 0.5),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.10),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 110,
                        width: 75,
                        decoration: BoxDecoration(
                          image: DecorationImage(fit: BoxFit.fill, image: NetworkImage(poster.toString())),
                            borderRadius: BorderRadius.circular(12)),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            namaFilm.toString(),
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 15),
                          Text("User Score : " + score.toString()),
                          Text("Release : " + release.toString()),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(width: 0.5)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Sinopsis",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 10),
                      Text(
                        sinopsis.toString(),
                        textAlign: TextAlign.justify,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
