import 'package:flutter/material.dart';
import 'package:compendium/features/feature_config.dart';

final FeatureConfig bookClubFeature = FeatureConfig(
  id: '9',
  name: 'book_club',
  path: 'book-club',
  builder: (context, state) => Scaffold(
    appBar: AppBar(title: const Text('Project 9: Book Club')),
    body: const Center(child: Text('Project 9: Social Book Club Manager - TODO')),
  ),
  metadata: const FeatureMetadata(
    title: 'Social Book Club Manager',
    description: 'User authentication (email/password + Google Sign-In)\nCloud data synchronization across devices\nBook club creation and management with invite codes\nPersonalized daily reading recommendations per member\nDemocratic voting system for next book selections\nReading progress tracking with personal notes\nThreaded discussion system per book\nPush notification system for club activities\nAdministrative controls for club moderators\nPDF export of reading history and statistics',
  ),
);
