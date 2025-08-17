import 'package:flutter/material.dart';
import 'package:compendium/features/feature_config.dart';

final FeatureConfig randomPickerFeature = FeatureConfig(
  id: '6',
  name: 'random_picker',
  path: 'random-picker',
  builder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('Project 6: Random Movie Picker')),
    body: const Center(child: Text('Project 6: Random Movie Night Picker - TODO')),
  ),
  metadata: const FeatureMetadata(
    title: 'Random Movie Night Picker',
    description: 'Personal movie collection (minimum 30 entries)\nAnimated random selection with suspense build-up\nAdvanced filtering (exclude genres, ratings, runtime)\n"Not Tonight" temporary exclusion feature\nComprehensive selection history (last 10 picks with dates)\n"Surprise Me" mode bypassing all filters\nWatched/unwatched status tracking\nCustomizable filter preferences page',
  ),
);
