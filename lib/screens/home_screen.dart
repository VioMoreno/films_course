import 'package:flutter/material.dart';
import 'package:peliculas/providers/movies.provider.dart';
import 'package:peliculas/widgets/widgets.dart';
import 'package:provider/provider.dart';

import '../providers/movies.provider.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    final movieProvider = Provider.of<MoviesProvider>(context); 

    return  Scaffold(
      appBar: AppBar(
        title: const Text('PELICULAS EN CINES'),
        elevation: 0,
        actions: [
          IconButton(
            onPressed: (() {}), 
            icon: const Icon (Icons.search_outlined), color: Colors.black,
      )],
  
      ),
      body: SingleChildScrollView(
        child: Column (
          children:  [
            CardSwiper(movies: movieProvider.onDisplayMovie),
            MovieSlider (movie: movieProvider.popularMovies, title: 'POPULARES', onNextPage: () => movieProvider.getPopularMovies() ,), 
      ],
      )
      )
    );
  }
}