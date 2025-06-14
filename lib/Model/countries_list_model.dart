class CountriesListModel {
   int updated;
  final String country;
  final CountryInfo? countryInfo;
  final int cases;
  final int todayCases;
  final int deaths;
  final int todayDeaths;
  final int recovered;
  final int todayRecovered;
  final int active;
  final int critical;
  final int casesPerOneMillion;
  final int deathsPerOneMillion;
  final int tests;
  final int testsPerOneMillion;
  final int population;
  final String continent;
  final int oneCasePerPeople;
  final int oneDeathPerPeople;
  final int oneTestPerPeople;
  final double activePerOneMillion;
  final double recoveredPerOneMillion;
  final double criticalPerOneMillion;

  CountriesListModel({
    required this.updated,
    required this.country,
    required this.countryInfo,
    required this.cases,
    required this.todayCases,
    required this.deaths,
    required this.todayDeaths,
    required this.recovered,
    required this.todayRecovered,
    required this.active,
    required this.critical,
    required this.casesPerOneMillion,
    required this.deathsPerOneMillion,
    required this.tests,
    required this.testsPerOneMillion,
    required this.population,
    required this.continent,
    required this.oneCasePerPeople,
    required this.oneDeathPerPeople,
    required this.oneTestPerPeople,
    required this.activePerOneMillion,
    required this.recoveredPerOneMillion,
    required this.criticalPerOneMillion,
  });

  factory CountriesListModel.fromJson(Map<String, dynamic> json) {
    return CountriesListModel(
     updated: (json['updated'] ?? 0).toInt(),
     
cases: (json['cases'] ?? 0).toInt(),
todayCases: (json['todayCases'] ?? 0).toInt(),
deaths: (json['deaths'] ?? 0).toInt(),
todayDeaths: (json['todayDeaths'] ?? 0).toInt(),
recovered: (json['recovered'] ?? 0).toInt(),
todayRecovered: (json['todayRecovered'] ?? 0).toInt(),
active: (json['active'] ?? 0).toInt(),
critical: (json['critical'] ?? 0).toInt(),
casesPerOneMillion: (json['casesPerOneMillion'] ?? 0).toInt(),
deathsPerOneMillion: (json['deathsPerOneMillion'] ?? 0).toInt(),
tests: (json['tests'] ?? 0).toInt(),
testsPerOneMillion: (json['testsPerOneMillion'] ?? 0).toInt(),
population: (json['population'] ?? 0).toInt(),
oneCasePerPeople: (json['oneCasePerPeople'] ?? 0).toInt(),
oneDeathPerPeople: (json['oneDeathPerPeople'] ?? 0).toInt(),
oneTestPerPeople: (json['oneTestPerPeople'] ?? 0).toInt(),
activePerOneMillion: (json['activePerOneMillion'] ?? 0).toDouble(),
recoveredPerOneMillion: (json['recoveredPerOneMillion'] ?? 0).toDouble(),
criticalPerOneMillion: (json['criticalPerOneMillion'] ?? 0).toDouble(), country: json['country'] ?? '',
    countryInfo: json['countryInfo'] != null
        ? CountryInfo.fromJson(json['countryInfo'])
        : null, continent: '',

    );
  }

  Map<String, dynamic> toJson() {
    return {
      'updated': updated,
      'country': country,
      'countryInfo': countryInfo?.toJson(),
      'cases': cases,
      'todayCases': todayCases,
      'deaths': deaths,
      'todayDeaths': todayDeaths,
      'recovered': recovered,
      'todayRecovered': todayRecovered,
      'active': active,
      'critical': critical,
      'casesPerOneMillion': casesPerOneMillion,
      'deathsPerOneMillion': deathsPerOneMillion,
      'tests': tests,
      'testsPerOneMillion': testsPerOneMillion,
      'population': population,
      'continent': continent,
      'oneCasePerPeople': oneCasePerPeople,
      'oneDeathPerPeople': oneDeathPerPeople,
      'oneTestPerPeople': oneTestPerPeople,
      'activePerOneMillion': activePerOneMillion,
      'recoveredPerOneMillion': recoveredPerOneMillion,
      'criticalPerOneMillion': criticalPerOneMillion,
    };
  }
}

class CountryInfo {
  final int? id;
  final String? iso2;
  final String? iso3;
  final double? lat;
  final double? long;
  final String? flag;

  CountryInfo({
    this.id,
    this.iso2,
    this.iso3,
    this.lat,
    this.long,
    this.flag,
  });

  factory CountryInfo.fromJson(Map<String, dynamic> json) {
    return CountryInfo(
      id: json['_id'],
      iso2: json['iso2'],
      iso3: json['iso3'],
      lat: (json['lat'] ?? 0).toDouble(),
      long: (json['long'] ?? 0).toDouble(),
      flag: json['flag'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'iso2': iso2,
      'iso3': iso3,
      'lat': lat,
      'long': long,
      'flag': flag,
    };
  }
}




// class CountriesListModel {
//   int? updated;
//   String? country;
//   CountryInfo? countryInfo;
//   int? cases;
//   int? todayCases;
//   int? deaths;
//   int? todayDeaths;
//   int? recovered;
//   int? todayRecovered;
//   int? active;
//   int? critical;
//   int? casesPerOneMillion;
//   int? deathsPerOneMillion;
//   int? tests;
//   int? testsPerOneMillion;
//   int? population;
//   String? continent;
//   int? oneCasePerPeople;
//   int? oneDeathPerPeople;
//   int? oneTestPerPeople;
//   double? activePerOneMillion;
//   double? recoveredPerOneMillion;
//   int? criticalPerOneMillion;

//   CountriesListModel(
//       {this.updated,
//       this.country,
//       this.countryInfo,
//       this.cases,
//       this.todayCases,
//       this.deaths,
//       this.todayDeaths,
//       this.recovered,
//       this.todayRecovered,
//       this.active,
//       this.critical,
//       this.casesPerOneMillion,
//       this.deathsPerOneMillion,
//       this.tests,
//       this.testsPerOneMillion,
//       this.population,
//       this.continent,
//       this.oneCasePerPeople,
//       this.oneDeathPerPeople,
//       this.oneTestPerPeople,
//       this.activePerOneMillion,
//       this.recoveredPerOneMillion,
//       this.criticalPerOneMillion});

//   CountriesListModel.fromJson(Map<String, dynamic> json) {
//     updated = json['updated'];
//     country = json['country'];
//     countryInfo = json['countryInfo'] != null
//         ? CountryInfo.fromJson(json['countryInfo'])
//         : null;
//     cases = json['cases'];
//     todayCases = json['todayCases'];
//     deaths = json['deaths'];
//     todayDeaths = json['todayDeaths'];
//     recovered = json['recovered'];
//     todayRecovered = json['todayRecovered'];
//     active = json['active'];
//     critical = json['critical'];
//     casesPerOneMillion = json['casesPerOneMillion'];
//     deathsPerOneMillion = json['deathsPerOneMillion'];
//     tests = json['tests'];
//     testsPerOneMillion = json['testsPerOneMillion'];
//     population = json['population'];
//     continent = json['continent'];
//     oneCasePerPeople = json['oneCasePerPeople'];
//     oneDeathPerPeople = json['oneDeathPerPeople'];
//     oneTestPerPeople = json['oneTestPerPeople'];
//     activePerOneMillion = json['activePerOneMillion'];
//     recoveredPerOneMillion = json['recoveredPerOneMillion'];
//     criticalPerOneMillion = json['criticalPerOneMillion'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['updated'] = updated;
//     data['country'] = country;
//     if (countryInfo != null) {
//       data['countryInfo'] = countryInfo!.toJson();
//     }
//     data['cases'] = cases;
//     data['todayCases'] = todayCases;
//     data['deaths'] = deaths;
//     data['todayDeaths'] = todayDeaths;
//     data['recovered'] = recovered;
//     data['todayRecovered'] = todayRecovered;
//     data['active'] = active;
//     data['critical'] = critical;
//     data['casesPerOneMillion'] = casesPerOneMillion;
//     data['deathsPerOneMillion'] = deathsPerOneMillion;
//     data['tests'] = tests;
//     data['testsPerOneMillion'] = testsPerOneMillion;
//     data['population'] = population;
//     data['continent'] = continent;
//     data['oneCasePerPeople'] = oneCasePerPeople;
//     data['oneDeathPerPeople'] = oneDeathPerPeople;
//     data['oneTestPerPeople'] = oneTestPerPeople;
//     data['activePerOneMillion'] = activePerOneMillion;
//     data['recoveredPerOneMillion'] = recoveredPerOneMillion;
//     data['criticalPerOneMillion'] = criticalPerOneMillion;
//     return data;
//   }
// }

// class CountryInfo {
//   int? iId;
//   String? iso2;
//   String? iso3;
//   int? lat;
//   int? long;
//   String? flag;

//   CountryInfo({this.iId, this.iso2, this.iso3, this.lat, this.long, this.flag});

//   CountryInfo.fromJson(Map<String, dynamic> json) {
//     iId = json['_id'];
//     iso2 = json['iso2'];
//     iso3 = json['iso3'];
//     lat = json['lat'];
//     long = json['long'];
//     flag = json['flag'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['_id'] = iId;
//     data['iso2'] = iso2;
//     data['iso3'] = iso3;
//     data['lat'] = lat;
//     data['long'] = long;
//     data['flag'] = flag;
//     return data;
//   }
// }