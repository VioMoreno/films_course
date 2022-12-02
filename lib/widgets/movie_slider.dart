
import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';

class MovieSlider extends StatelessWidget {

    final List<Movie> movie; 
    final String? title; 
   
  const MovieSlider({Key? key, required this.movie, this.title}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [

        if (this.title != null )
           Padding(
            padding: const EdgeInsets.symmetric(horizontal:20),
            child: Text(this.title!, style: TextStyle (fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(158, 236, 48, 45)),)
            ),

            const SizedBox(height: 5),

          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movie.length,
              itemBuilder: (_, int index) =>   _MoviePoster(movie: movie[index])
              
            
             ),
          ),
        ],
      ),
    );
  }
}

class _MoviePoster extends StatelessWidget {

  final Movie movie; 
   
  const _MoviePoster({Key? key,  required this.movie}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 190,
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children:  [

          GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details', arguments: 'movie-instance'),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child:  FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'), 
                image: NetworkImage(movie.fullPosterImg),
                height: 190,
                width: 130,
                fit: BoxFit.cover,
                ),
            ),
          ),

            const SizedBox(height: 3),

             Flexible(
              child: Text(movie.title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              textAlign: TextAlign.center,),
            )
        ],
      ) ,
    );
  }
}