import 'dart:convert';

import 'package:covid_tracker/services/utilities/app_url.dart';

import '../model/WorldStatesModel.dart';
import 'package:http/http.dart' as http;

class StatesServices{

  Future<WorldStatesModel> worldStatesApi() async{

    final response = await http.get(Uri.parse(AppUrl.worldStatesUrl));

    if(response.statusCode == 200){
      var data = jsonDecode(response.body);

      return WorldStatesModel.fromJson(data);
    }
    else{
      throw Exception('error');
    }
  }

   Future<List<dynamic>> countriesStatesApi() async{

    var data;

    final response = await http.get(Uri.parse(AppUrl.countriesStatesUrl));

    if(response.statusCode == 200){
      data = jsonDecode(response.body);
      return data;
    }
    else{
      throw Exception('error');
    }

   }
}