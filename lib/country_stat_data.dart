import 'Stats.dart';

class CountryStat {
  String country;
  List<Stats> stats;

  CountryStat({this.country, this.stats});

  factory CountryStat.fromJson(Map<String, dynamic> countryStatjson){

    var list = countryStatjson['latest_stat_by_country'] as List;
    List<Stats> statsList = list.map((i) => Stats.fromJson(i)).toList();

    return CountryStat(
      country: countryStatjson["country"],
      stats: statsList,
    );
  }

}