import 'dart:math';

import 'package:flutter/material.dart';
import '../models/movie_model.dart';

final List<Movie> initialData = List.generate(
  50,
  (index) => Movie(
      movieTitle: 'Movie $index',
      movieDuration: '${Random().nextInt(100) + 60} minutes'),
);
