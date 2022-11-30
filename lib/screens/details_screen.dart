import 'package:flutter/material.dart';
import 'package:peliculas/widgets/widgets.dart';

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
              _Overview(),
              _Overview(),
              _Overview(),
              CastingCards(),
              

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
          padding: const EdgeInsets.only(bottom: 10),
          child: const Text(
            'movie.title',
            style: TextStyle( fontSize: 16, color: Colors.black),
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


class _Overview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final TextTheme textTheme = Theme.of(context).textTheme; 

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text ('Dolor nisi sit sint quis et sint officia quis in labore. Aute enim culpa voluptate aliqua sint pariatur ut ad duis anim deserunt labore incididunt. Sit ad anim non excepteur consequat magna eu excepteur cupidatat ex adipisicing incididunt dolore. Est tempor elit id voluptate in cupidatat. Sit incididunt ea nulla anim nostrud mollit eiusmod nisi dolor aliqua sint cupidatat pariatur. Eu consectetur quis velit est eiusmod eiusmod eu nisi sunt veniam. Elit et laboris mollit nulla.', textAlign: TextAlign.justify,
      style: textTheme.subtitle2,)
    );
    
  }
}

