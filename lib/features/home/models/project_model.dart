import 'package:flutter/material.dart';

enum ProjectStatus { locked, inProgress, completed }

class ProjectModel {
  final String id;
  final String title;
  final ProjectStatus status;
  final String? coverImagePath;
  final String? description;

  ProjectModel({
    required this.id,
    required this.title,
    required this.status,
    this.coverImagePath,
    this.description,
  });

  Color get statusColor {
    switch (status) {
      case ProjectStatus.locked:
        return Colors.grey;
      case ProjectStatus.inProgress:
        return Colors.orange[200]!;
      case ProjectStatus.completed:
        return Colors.green;
    }
  }

  IconData get statusIcon {
    switch (status) {
      case ProjectStatus.locked:
        return Icons.lock;
      case ProjectStatus.inProgress:
        return Icons.play_circle_fill;
      case ProjectStatus.completed:
        return Icons.check_circle;
    }
  }
}
