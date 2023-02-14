import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:random_people/model/Random.dart';

class RandomAPIHelper{
  RandomAPIHelper._();

  static final RandomAPIHelper randomAPIHelper = RandomAPIHelper._();

  Future<Random?> fetchRandomPerson()async{
    String api = "https://randomuser.me/api/";

    http.Response response = await http.get(Uri.parse(api),);

    if(response.statusCode ==200){
      Map decodedData = jsonDecode(response.body);

      Random random = Random.fromMap(json: decodedData);

      return random;
    }
    return null;
  }
}