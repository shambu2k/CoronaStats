import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'corona.dart';

class AffectedCountries extends StatefulWidget {
  @override
  _AffectedCountriesState createState() => _AffectedCountriesState();
}

class _AffectedCountriesState extends State<AffectedCountries> {

  List<String> countries = [];
  Response response;

  Widget countryCard(String country, int pos){
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
        child: Card(
          color: Colors.white,
          margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(country, style: TextStyle(
                fontFamily: 'Montserrat',
                fontSize: 28.0,
                color: Colors.blueAccent,
                fontWeight: FontWeight.bold,
              ),)
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => Corona(country: countries[pos]),
        ),);
        print('row $pos');
      },
    );
  }

  void getData() async {
    response = await get('https://coronavirus-monitor.p.rapidapi.com/coronavirus/affected.php',
        headers: {
          'x-rapidapi-host': 'coronavirus-monitor.p.rapidapi.com',
          'x-rapidapi-key': '7c3f55d687msh1119b7cb378311ep151360jsnce6b499c132e'
        });
    Map data = jsonDecode(response.body);
    countries = List.from(data['affected_countries']);
    print(countries);
  }

  @override
  void initState() {
    getData();
    Future.delayed(Duration(seconds: 2),() async {
      setState(() {});
    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    print('Build executed');
    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        title: Text('Affected Countries'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: new ListView.builder(
        itemCount: countries.length,
        itemBuilder: (BuildContext context, int pos){
          return countryCard(countries[pos], pos);
        },
      ),
    );
  }
}
