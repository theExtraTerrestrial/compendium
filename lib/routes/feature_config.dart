import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FeatureConfig {
  final String id;
  final String name;
  final String path;
  final Widget Function(BuildContext context, GoRouterState state) builder;
  final List<GoRoute> routes;

  FeatureConfig({
    required this.id,
    required this.name,
    required this.path,
    required this.builder,
    List<GoRoute>? routes,
  }) : routes = routes ?? [];
}
