import 'package:flutter/material.dart';
import 'package:compendium/features/feature_config.dart';

final FeatureConfig dailyQuoteFeature = FeatureConfig(
  id: '3',
  name: 'daily_quote',
  path: 'daily-quote',
  builder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('Project 3: Daily Quote')),
    body: const Center(child: Text('Project 3: Daily Anime Quote Generator - TODO')),
  ),
  metadata: const FeatureMetadata(
    title: 'Daily Anime Quote Generator',
    description: 'Database of 50+ anime character quotes\nSingle daily quote that changes at midnight\n"Favorite Quote" functionality with local persistence\nDedicated favorites screen showing saved quotes\nQuote history showing last 7 days of displayed quotes\nCharacter attribution and source anime display\nClean typography with proper text hierarchy',
  ),
);
