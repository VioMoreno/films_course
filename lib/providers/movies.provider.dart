
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;


class MoviesProvider extends ChangeNotifier {

   String _apiKey= '7f5fa5f9d6e5d6ba27dbe56e05692cf8'; 
   String _baseUrl= 'api.themoviedb.org'; 
   String _lenguage= 'es-ES'; 

  MoviesProvider(){
    print ('MoviesProvider inicializado');
    getPlayMovies();
  }

getPlayMovies() async {

  var url = Uri.https(_baseUrl, '3/movie/now_playing', {
    'api_key': _apiKey,
    'lenguage': _lenguage,
    'page': '1',
  });

  final  response = await http.get(url); 
  final Map <String, dynamic> decodeData = json.decode(response.body);
  print (decodeData); 
}

}