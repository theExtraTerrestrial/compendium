import 'package:flutter/material.dart';
import 'package:compendium/features/feature_config.dart';

final FeatureConfig characterEncyclopediaFeature = FeatureConfig(
  id: '10',
  name: 'character_encyclopedia',
  path: 'character-encyclopedia',
  builder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('Project 10: Character Encyclopedia')),
    body: const Center(child: Text('Project 10: Anime Character Encyclopedia - TODO')),
  ),
  metadata: const FeatureMetadata(
    title: 'Anime Character Encyclopedia',
    description: 'Comprehensive database of 200+ anime characters\nDaily character reveal system (exactly one per day at midnight)\nRich character detail pages (name, series, biography, stats, relationships)\nComplete character gallery with search and filtering\nInteractive calendar showing reveal history\nPersonal favorites collection with custom organization\nCharacter comparison tool with side-by-side statistics\nSearch functionality limited to previously revealed characters\nConsecutive day streak tracking with rewards\nSocial media sharing with custom character cards\nCustomizable notification scheduling',
  ),
);
