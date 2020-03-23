import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterkundi/country_stat_data.dart';
import 'Stats.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Corona extends StatefulWidget {

  final String country;
  Corona({Key key, @required this.country}) : super(key : key);

  @override
  _CoronaState createState(){
    return _CoronaState(country: country);
  }
}

class _CoronaState extends State<Corona> {

  String country;
  String totDeaths;
  String totActiveCases;
  String totRecovered;
  String totCases;

  _CoronaState({Key key, @required this.country});

  void getCountryData(String country) async {

    Response response = await get('https://coronavirus-monitor.p.rapidapi.com/coronavirus/latest_stat_by_country.php?country=$country',
    headers: {
      "x-rapidapi-host": "coronavirus-monitor.p.rapidapi.com",
      "x-rapidapi-key": "7c3f55d687msh1119b7cb378311ep151360jsnce6b499c132e"
    });
    final jsonresponse = json.decode(response.body);
    CountryStat countryStat = CountryStat.fromJson(jsonresponse);
    totCases = countryStat.stats[0].totalCases;
    totActiveCases = countryStat.stats[0].activeCases;
    totDeaths = countryStat.stats[0].totalDeaths;
    totRecovered = countryStat.stats[0].totalRecovered;
  }


  @override
  void initState() {
    super.initState();
    getCountryData(country);
    Future.delayed(Duration(seconds: 2),() async {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        elevation: 0.0,
        title: Text('Corona Stats'),
        backgroundColor: Colors.blue[400],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                            child: Text(
                              'Country',
                              style: TextStyle(
                                  fontSize: 18.0,
                                  color: Colors.white70,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                          Text(
                            '$country',
                            style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.bold,
                                color: Colors.blue[400],
                                fontSize: 44.0),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text(
                                'Total Cases',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white70,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                            Text(
                              '$totCases',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber[400],
                                  fontSize: 44.0),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text(
                                'Total Active Cases',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white70,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                            Text(
                              '$totActiveCases',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red[400],
                                  fontSize: 44.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text(
                                'Total Deaths',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white70,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                            Text(
                              '$totDeaths',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[400],
                                  fontSize: 44.0),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text(
                                'Total Recovered',
                                style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.white70,
                                    fontFamily: 'Montserrat'),
                              ),
                            ),
                            Text(
                              '$totRecovered',
                              style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[400],
                                  fontSize: 44.0),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}