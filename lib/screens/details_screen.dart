import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
   
  const DetailsScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-movie'; 



    return  Scaffold(
      body: CustomScrollView(
        slivers: [
          _CustomAppBar ()
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
          color: Colors.black38,
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