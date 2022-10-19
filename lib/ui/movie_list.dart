import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/model/movie.dart';
import 'package:provider_test/provider/movie_provider.dart';

class MovieList extends StatefulWidget {
  const MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  MovieProvider _movieProvider = MovieProvider();

  @override
  void dispose() {
    _movieProvider.clearMovies();
    super.dispose();
  }

  Widget _makeMovieOne(Movie movie) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)),
          child: Image.network(movie.posterUrl),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  movie.title,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 2,
                ),
                Expanded(
                    child: Container(
                  child: Text(
                    movie.overview,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 13),
                    maxLines: 2,
                  ),
                ))
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _makeListView(List<Movie> movies) {
    return ListView.separated(
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 1,
                      offset: Offset(0, 0),
                    )
                  ]),
              child: _makeMovieOne(movies[index]),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Divider(
            height: 2,
          );
        },
        itemCount: movies.length);
  }

  //init next call
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _movieProvider = Provider.of<MovieProvider>(context, listen: false); //provider init
    _movieProvider.loadMovies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('1'),
      ),
      body: Consumer<MovieProvider>(
       builder: (context, value, child){
         if(value.movies.length > 0){
           return _makeListView(value.movies);
         }
         return Center(child: CircularProgressIndicator(),);
       },
      ),
    );
  }
}
