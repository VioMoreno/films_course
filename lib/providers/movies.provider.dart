

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas/models/movie.dart';
import 'package:peliculas/models/now_playing_response.dart';
import 'package:peliculas/models/popular_response.dart';


class MoviesProvider extends ChangeNotifier {

   String _apiKey= '7f5fa5f9d6e5d6ba27dbe56e05692cf8'; 
   String _baseUrl= 'api.themoviedb.org'; 
   String _lenguage= 'es-ES'; 

 List <Movie> onDisplayMovie = []; 
 List <Movie> popularMovies = []; 

 
  MoviesProvider(){
    print ('MoviesProvider inicializado');
    getPlayMovies();
    getPopularMovies();
  }

getPlayMovies() async {

  var url = Uri.https(_baseUrl, '3/movie/now_playing', {
    'api_key': _apiKey,
    'lenguage': _lenguage,
    'page': '1',
  });

  final  response = await http.get(url); 
  final nowPlayingResponde = NowPlayingResponse.fromJson(response.body);

  onDisplayMovie = nowPlayingResponde.results;
  notifyListeners(); 
}

getPopularMovies() async {
var url = Uri.https(_baseUrl, '3/movie/popular', {
    'api_key': _apiKey,
    'lenguage': _lenguage,
    'page': '1',
  });

  final  response = await http.get(url); 
  final popularResponse = PopularResponse.fromJson(response.body);

  popularMovies = [...popularMovies, ...popularResponse.results]; 
  notifyListeners(); 
}

}












