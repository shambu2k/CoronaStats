import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterkundi/affected_countries.dart';
import 'corona.dart';

void main() {
  return runApp(MaterialApp(
    home: AffectedCountries(),
    routes: {
      '/Corona' : (context) => Corona(),
      '/AffectedCountries' : (context) => AffectedCountries(),
    },
  ));
}