import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DiscoverDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("DETAIL"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(height: 210, color: Colors.red),
              Container(
                height: 130,
                color: Colors.blue,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 110,
                        width: 75,
                        decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(12)
                        ),
                      ),
                      SizedBox(width: 15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            "Dilan 1990",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w700),
                          ),
                          SizedBox(height: 15),
                          Text("Gendre : " + "Drama"),
                          Text("Duration : " + "1h20m"),
                          Text("Release : " + "Drama"),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
