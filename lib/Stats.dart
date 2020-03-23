class Stats {
  String totalCases;
  String activeCases;
  String totalDeaths;
  String totalRecovered;

  Stats(
      {this.totalCases,
      this.activeCases,
      this.totalDeaths,
      this.totalRecovered});

  factory Stats.fromJson(Map<String, dynamic> statsJson) => Stats(
        totalCases: statsJson["total_cases"],
        activeCases: statsJson["active_cases"],
        totalDeaths: statsJson["total_deaths"],
        totalRecovered: statsJson["total_recovered"],
      );
}
