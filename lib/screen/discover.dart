import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movie_catalog/model/discovermodel.dart';

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
    var url = "https://api.themoviedb.org/3/discover/movie?api_key=0306e5bd0f15d8ace9501d54c2ef75ee";
    var response = await http.get(url);
    if(response.statusCode == 200) {
      var items = json.decode(response.body)['results'];
      setState(() {
        discovers = items;
        isLoading = false;
      });
    }else {
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
        title: Text("DISCOVER"),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    if(discovers.contains(null) || discovers.length < 0 || isLoading) {
      return Center(child: CircularProgressIndicator(valueColor: new AlwaysStoppedAnimation<Color>(Colors.blueGrey),));
    }
    return ListView.builder(
        itemCount: discovers.length,
        itemBuilder: (context, index) {
          return getCard(discovers[index]);
        });
  }

  Widget getCard(item) {
    var namaFilm = item['title'];
    var release = item['release_date'];
    var poster = "https://image.tmdb.org/t/p/w500/" + item['poster_path'];
    return Card(
        child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        title: Row(
          children: <Widget>[
            Container(
              width: 80,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(
                      poster.toString()),
                ),
              ),
            ),
            SizedBox(width: 20,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Text(namaFilm.toString(), style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700)),
                SizedBox(height: 10),
                Text("Release " + release.toString(), style: TextStyle(color: Colors.grey),),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
