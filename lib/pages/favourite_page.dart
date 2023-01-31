import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    final _favourites = context.watch<MovieProvider>().favourites;
    return Scaffold(
      appBar: AppBar(
        title: Text('favourites'),
      ),
      body: ListView.builder(
          itemCount: _favourites.length,
          itemBuilder: (_, index) {
            final currentMovie = _favourites[index];
            return Card(
              key: ValueKey(currentMovie.movieTitle),
              elevation: 4,
              child: ListTile(
                title: Text(currentMovie.movieTitle),
                subtitle: Text(currentMovie.movieDuration ?? ''),
                trailing: TextButton(
                  onPressed: () {
                    context
                        .read<MovieProvider>()
                        .removeFromFavourites(currentMovie);
                  },
                  child: const Text(
                    'Remove',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
