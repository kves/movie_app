import 'package:flutter/material.dart';
import 'package:movie_app/pages/favourite_page.dart';
import 'package:movie_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var favourites = context.watch<MovieProvider>().favourites;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FavouritePage(),
                  ),
                );
              },
              icon: const Icon(Icons.favorite),
              label: Text(
                'Go to Favourites (${favourites.length})',
                style: const TextStyle(fontSize: 24),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 20)),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: movies.length,
                itemBuilder: (_, index) {
                  final currentMovie = movies[index];
                  return Card(
                    key: ValueKey(currentMovie.movieTitle),
                    color: Colors.blue,
                    elevation: 5,
                    child: ListTile(
                      title: Text(
                        currentMovie.movieTitle,
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        currentMovie.movieDuration ?? 'No information',
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          Icons.favorite,
                          color: favourites.contains(currentMovie)
                              ? Colors.red
                              : Colors.white,
                          size: 30,
                        ),
                        onPressed: () {
                          if (!favourites.contains(currentMovie)) {
                            context
                                .read<MovieProvider>()
                                .addToFavourites(currentMovie);
                          } else {
                            context
                                .read<MovieProvider>()
                                .removeFromFavourites(currentMovie);
                          }
                        },
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
