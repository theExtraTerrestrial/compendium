import 'package:flutter/material.dart';
import 'package:compendium/features/feature_config.dart';

final FeatureConfig gameDiscoveryFeature = FeatureConfig(
  id: '8',
  name: 'game_discovery',
  path: 'game-discovery',
  builder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('Project 8: Game Discovery')),
    body: const Center(child: Text('Project 8: Game Discovery Platform - TODO')),
  ),
  metadata: const FeatureMetadata(
    title: 'Game Discovery Platform',
    description: 'RAWG API integration for game data\nMulti-parameter filtering (platform, genre, release year, rating)\nDetailed game pages (screenshots, descriptions, Metacritic scores)\nPersonal game collections ("Owned", "Wishlist", "Completed")\nDaily featured game with automatic rotation\nAdvanced search with multiple simultaneous filters\nImage caching for optimal performance\nSystem share sheet integration for recommendations\nOffline mode displaying cached content\nAPI rate limiting and key management',
  ),
);
