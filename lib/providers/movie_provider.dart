import 'dart:math';

import 'package:flutter/material.dart';
import '../models/movie_model.dart';

final List<Movie> initialData = List.generate(
  50,
  (index) => Movie(
      movieTitle: 'Movie $index',
      movieDuration: '${Random().nextInt(100) + 60} minutes'),
);

class MovieProvider with ChangeNotifier {
  final List<Movie> _movies = initialData;
  List<Movie> get movies => _movies;

  final List<Movie> _favourites = [];
  List<Movie> get favourites => _favourites;

  void addToFavourites(Movie movie) {
    _favourites.add(movie);
    notifyListeners();
  }

  void removeFromFavourites(Movie movie) {
    _favourites.remove(movie);
    notifyListeners();
  }
}
