
import 'dart:convert';

import 'package:covid_tracker/models/services/appUrl/app_url.dart';
import 'package:covid_tracker/models/world_states_model.dart';
import 'package:http/http.dart' as http;


class StateServices {
  //! fetchWorldStateRecords
  Future<WorldStatesModels> fetchWorldStateRecords () async {
    final response = await http.get(Uri.parse(AppUrl.worldStatesApi));
    

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatesModels.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  //! CountriesList
  Future<List<dynamic>> countriesListApi () async {
    var data;
    final response = await http.get(Uri.parse(AppUrl.countriesList));
    //print(response.body);
    
    if (response.statusCode == 200) {
      print("The api is called success");
       data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}