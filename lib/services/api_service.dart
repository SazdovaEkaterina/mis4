import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService{

  static Future<http.Response> getClothingFromClothingAPI() async {
    var response = await http.get(Uri.parse("https://clothingapi.co/api/v2/clothing?limit=250"));
    print("Response: ${response.body}");
    return response;
  }
  
  static Future<dynamic> getAbilitiesForClothing(String id) async{
    final response = await http.get(Uri.parse("https://clothingapi.co/api/v2/clothing/$id"));
    if (response.statusCode == 200) {
      print("Success: ${response.body}");
      var data = jsonDecode(response.body);
      print("data $data");
      return data;
    }
    else{
      throw Exception("Failed to load data!");
    }
  }
}