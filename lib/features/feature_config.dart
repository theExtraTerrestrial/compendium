import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:compendium/features/home/models/project_status.dart';

class FeatureConfig {
  final String id;
  final String name;
  final String path;
  final Widget Function(BuildContext context, GoRouterState state) builder;
  final List<GoRoute> routes;
  final FeatureMetadata? metadata;

  FeatureConfig({
    required this.id,
    required this.name,
    required this.path,
    required this.builder,
    List<GoRoute>? routes,
    this.metadata,
  }) : routes = routes ?? [];
}

// Small metadata holder to keep FeatureConfig focused on routing.
class FeatureMetadata {
  final String? title;
  final String? description;
  final String? coverImagePath;
  final ProjectStatus? status;

  const FeatureMetadata({this.title, this.description, this.coverImagePath, this.status});
}
