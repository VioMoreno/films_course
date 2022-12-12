

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

 int _popularPage = 0; 

 
  MoviesProvider(){
    print ('MoviesProvider inicializado');
    getPlayMovies();
    getPopularMovies();
  }

  Future <String> _getJsonData (String endpoint, [int page = 1]) async {
    var url = Uri.https(_baseUrl, endpoint, {
    'api_key': _apiKey,
    'lenguage': _lenguage,
    'page': '$page',
  });

  final  response = await http.get(url); 
  return response.body; 
  }

getPlayMovies() async {

  final jsonData = await _getJsonData('3/movie/now_playing'); 
  final nowPlayingResponde = NowPlayingResponse.fromJson(jsonData);

  onDisplayMovie = nowPlayingResponde.results;
  notifyListeners(); 
}

getPopularMovies() async {
  _popularPage++; 

  final jsonData = await _getJsonData('3/movie/popular', _popularPage); 
  final popularResponse = PopularResponse.fromJson(jsonData);

  popularMovies = [...popularMovies, ...popularResponse.results]; 
  notifyListeners(); 
}

}












