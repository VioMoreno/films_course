import 'package:flutter/material.dart';
import 'package:peliculas/models/movie.dart';
import 'package:peliculas/widgets/widgets.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;



    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar (movie),
          SliverList(
            delegate: SliverChildListDelegate ([
              _PosterAndTitle(movie),
              _Overview(movie),
              CastingCards(),
              

            ]))
        ],
      )
    );
  }
}


class _CustomAppBar extends StatelessWidget {

  final Movie movie;

  const _CustomAppBar(this.movie); 

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      backgroundColor: Colors.orange[900],
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: const EdgeInsets.all(0),
        title: Container(
          alignment: Alignment.bottomCenter,
          color: Colors.black12,
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
          child:  Text(
            movie.title,
            textAlign: TextAlign.center,
            style: const TextStyle( fontSize: 16, color: Colors.black),
            ),

        ),

        background:  FadeInImage(
          placeholder:  AssetImage('assets/loading.gif'), 
        image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
          ),
      ),
    );
  }
}


class _PosterAndTitle extends StatelessWidget {

  final Movie movie;

  const _PosterAndTitle(this.movie); 

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme; 
    final size = MediaQuery.of(context).size;
    
    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric( horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:  FadeInImage(
              placeholder:  AssetImage('assets/no-image.jpg'),
              image: NetworkImage (movie.fullPosterImg),
              height: 150,
            ),
          ),

        const SizedBox(width: 20,), 

        ConstrainedBox(
          constraints: BoxConstraints (maxWidth: size.width - 190),
           child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Text(movie.title, style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2),
              Text(movie.originalTitle, style: textTheme.subtitle1, overflow: TextOverflow.ellipsis, maxLines: 2),
         
              Row(
                children: [
                  const Icon(Icons.star_border_rounded, size: 20, color: Colors.green,),
                  const SizedBox( width: 10,),
                  Text( '${movie.voteAverage}', style: textTheme.caption,)
                ],
              )
         
            ],
         
                 ),
         )
      ]),
    );

  }
}


class _Overview extends StatelessWidget {

  final Movie movie;

  const _Overview(this.movie); 

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme; 

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text (movie.overview, textAlign: TextAlign.justify,
      style: textTheme.subtitle2,)
    );
    
  }
}

