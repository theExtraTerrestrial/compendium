import 'package:flutter/material.dart';
import 'package:compendium/features/feature_config.dart';

final FeatureConfig movieWatchlistFeature = FeatureConfig(
  id: '4',
  name: 'movie_watchlist',
  path: 'movie-watchlist',
  builder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('Project 4: Movie Watchlist')),
    body: const Center(child: Text('Project 4: Movie Watchlist Manager - TODO')),
  ),
  metadata: const FeatureMetadata(
    title: 'Movie Watchlist Manager',
    description: 'Manual movie entry (title, year, genre, poster URL input)\nThree status categories: "Want to Watch", "Watching", "Completed"\nDrag-and-drop or button-based status transitions\nSearch and filter functionality by title/genre\nMovie deletion with confirmation dialogs\nCategory counters and progress statistics\nExport watchlist to shareable text format\nFull data persistence between sessions',
  ),
);
