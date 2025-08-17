import 'package:flutter/material.dart';
import 'package:compendium/features/feature_config.dart';

final FeatureConfig episodeTrackerFeature = FeatureConfig(
  id: '5',
  name: 'episode_tracker',
  path: 'episode-tracker',
  builder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('Project 5: Episode Tracker')),
    body: const Center(child: Text('Project 5: TV Show Episode Tracker - TODO')),
  ),
  metadata: const FeatureMetadata(
    title: 'TV Show Episode Tracker',
    description: 'Multi-level data structure (Shows → Seasons → Episodes)\nIndividual episode check-off functionality\nSeason and show-level progress bars\nEpisode detail views (title, air date, synopsis)\n"Next Episode to Watch" recommendation system\nComprehensive statistics dashboard (total episodes, viewing time)\nData backup and restore functionality\nProgress visualization charts',
  ),
);
