
import 'dart:convert';
import 'package:covid19_tracker/Model/world_stats_model.dart';
import 'package:covid19_tracker/Services/Utilities/app_url.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WorldStatsService {

   Future<WorldStatsModel> fetchWorldStats() async {
    final response = await http.get(Uri.parse(AppUrl.worldStatsApi));
    
    if (response.statusCode == 200){
      var data = jsonDecode(response.body);
      return WorldStatsModel.fromJson(data); 
    }else{
      throw Exception('Failed to Load Wolrd Stats');
    }


   }

     Future<List<dynamic>> countriesListApi() async {
    var data ;
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    if (kDebugMode) {
      print(response.statusCode.toString());
    }
    print(data);
    if (response.statusCode == 200) {
       data = jsonDecode(response.body.toString());
      return data;
    } else {
      throw Exception('Error');
    }
  }

}