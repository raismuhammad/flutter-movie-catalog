import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_catalog/screen/discoverDetail.dart';

class Discover extends StatefulWidget {
  @override
  _DiscoverState createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  List discovers = [];
  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.fetchDiscover();
  }

  fetchDiscover() async {
    setState(() {
      isLoading = true;
    });
    var url =
        "https://api.themoviedb.org/3/discover/movie?api_key=0306e5bd0f15d8ace9501d54c2ef75ee";
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var items = json.decode(response.body)['results'];
      setState(() {
        discovers = items;
        isLoading = false;
      });
    } else {
      setState(() {
        discovers = [];
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "DISCOVER",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if (discovers.contains(null) || discovers.length < 0 || isLoading) {
      return Center(
          child: CircularProgressIndicator(
        valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueGrey),
      ));
    }
    return ListView.builder(
        itemCount: discovers.length,
        itemBuilder: (context, index) {
          return getCard(discovers[index]);
        });
  }

  Widget getCard(item) {
    var id = item['id'];
    var namaFilm = item['title'];
    var sinopsis = item['overview'];
    var score = item['vote_average'];
    var release = item['release_date'];
    var poster = "https://image.tmdb.org/t/p/w500/" + item['poster_path'];
    var backPoster =  "https://image.tmdb.org/t/p/w500/" + item ['backdrop_path'];
    return Card(
        margin: const EdgeInsets.all(10),
        child: InkWell(
          onTap: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => DiscoverDetail(id : id, namaFilm : namaFilm, sinopsis : sinopsis, score : score, release : release, poster : poster, backPoster : backPoster))),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: ListTile(
              title: Row(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 130,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(poster.toString()),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(namaFilm.toString(),
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700)),
                      SizedBox(height: 5),
                      Text(
                        "Release " + release.toString(),
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(height: 20),
                      Text("Sinopsis",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700)),
                      SizedBox(height: 5),
                      Container(
                        width: 245,
                        child: Text(
                          sinopsis.toString(),
                          textAlign: TextAlign.justify,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
