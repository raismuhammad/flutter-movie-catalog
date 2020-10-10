import 'package:flutter/material.dart';

class Trending extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10),
          child: Stack(
            children: <Widget>[
              Container(
                height: 180,
                decoration: BoxDecoration(
                  boxShadow: [BoxShadow(
                    color: Colors.black,
                    spreadRadius: 0.1,
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  )],
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white,
                ),
              ),
              Positioned.fill(
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 10, 10, 10),
                  child: Row(children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Image.asset(
                        "images/hangout.jpg",
                        height: 150,
                        width: 100,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Hangout",
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                            Text(
                              "1h20min",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                              child: Text(
                                "Sinopsis",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Text(
                              "Milea ketemu Dilan dikantin lalu dia berkenalan terus pacaran deh",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}