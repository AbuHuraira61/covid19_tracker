import 'dart:convert';


import 'package:covid19_tracker/Model/countries_list_model.dart';
import 'package:covid19_tracker/Model/world_stats_model.dart';
import 'package:covid19_tracker/Services/Utilities/app_url.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



class StatsProvider extends ChangeNotifier {
  List<dynamic> countrylist = [];
  List< CountriesListModel> _countriesList = [];
 WorldStatsModel? _worldStats;
  WorldStatsModel? get worldStats => _worldStats;
  List<CountriesListModel> get countriesList => _countriesList;
  bool isLoading = true;


  void updateCountryList({
    required int totalCases,
    required int totalDeaths,
    required int totalRecovered,
    required String name,
    required String image,
  }) {
    countrylist.add({
      
      'image': image,
      'name': name,
      'totalCases': totalCases,
      'totalDeaths': totalDeaths,
      'totalRecovered': totalRecovered,
    });

    notifyListeners();
  }


  Future<WorldStatsModel> fetchWorldStats() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatsApi));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return WorldStatsModel.fromJson(data);
    } else {
      throw Exception('Failed to Load Wolrd Stats');
    }
  }
  
  Future<void> fetchWorldStatsList() async{
    isLoading = true;
    notifyListeners();
    _worldStats = await fetchWorldStats();
    isLoading = false;
    notifyListeners();
  }


  Future<List<CountriesListModel>> countriesListApi() async {
   
    final response = await http.get(Uri.parse(AppUrl.countriesList));

    if (response.statusCode == 200) {
     var  data = jsonDecode(response.body.toString());
     return (data as List)
    .map((e) => CountriesListModel.fromJson(e))
    .toList();

    } else {
      throw Exception('Error');
    }
  }
  Future<void> fetchCountriesList() async {
    isLoading = true;
     notifyListeners();
    _countriesList = await countriesListApi();
    isLoading = false;
    notifyListeners();
  }


}
