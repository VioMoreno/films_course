
import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';

class MovieSlider extends StatefulWidget {

    final List<Movie> movie; 
    final String? title; 
    final Function onNextPage;
   
  const MovieSlider({Key? key, required this.movie, this.title, required this.onNextPage}) : super(key: key);

  @override
  State<MovieSlider> createState() => _MovieSliderState();
}

class _MovieSliderState extends State<MovieSlider> {

  final ScrollController scrollController = ScrollController(); 

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() { 
      if (scrollController.position.pixels >= scrollController.position.maxScrollExtent - 500) {
        widget.onNextPage(); 
      }
      

    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [

        if (this.widget.title != null )
           Padding(
            padding: const EdgeInsets.symmetric(horizontal:20),
            child: Text(this.widget.title!, style: TextStyle (fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(158, 236, 48, 45)),)
            ),

            const SizedBox(height: 5),

          Expanded(
            child: ListView.builder(
              controller: scrollController,
              scrollDirection: Axis.horizontal,
              itemCount: widget.movie.length,
              itemBuilder: (_, int index) =>   _MoviePoster(movie: widget.movie[index])
              
            
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