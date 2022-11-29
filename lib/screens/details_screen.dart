import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie'; 



    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar (),
          SliverList(
            delegate: SliverChildListDelegate ([
              _PosterAndTitle(),
              

            ]))
        ],
      )
    );
  }
}


class _CustomAppBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  SliverAppBar(
      backgroundColor: Colors.yellowAccent,
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
          child: const Text(
            'movie.title',
            style: TextStyle( fontSize: 16),
            ),

        ),

        background: const FadeInImage(
          placeholder: AssetImage('assets/loading.gif'), 
        image: NetworkImage('https://via.placeholder.com/500x300'),
          fit: BoxFit.cover,
          ),
      ),
    );
  }
}


class _PosterAndTitle extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme; 

    return Container(
      margin: const EdgeInsets.only(top: 20),
      padding: const EdgeInsets.symmetric( horizontal: 20),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: const FadeInImage(
              placeholder: AssetImage('assets/no-image.jpg'),
              image: NetworkImage ('https://via.placeholder.com/200x300'),
              height: 150,
            ),
          ),

        const SizedBox(width: 20,), 

         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('movie.title', style: textTheme.headline5, overflow: TextOverflow.ellipsis, maxLines: 2),
            Text('movie.originalTitle', style: textTheme.subtitle1, overflow: TextOverflow.ellipsis),

            Row(
              children: [
                const Icon(Icons.star_border_rounded, size: 20, color: Colors.green,),
                const SizedBox( width: 10,),
                Text('movie.voteAverage', style: textTheme.caption,)
              ],
            )

          ],

        )
      ]),
    );

  }
}