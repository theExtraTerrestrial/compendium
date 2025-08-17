import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';

/// Service to handle navigation logic for the Home feature
/// This manages navigation between different projects within the compendium
class NavigationService {
  // Navigation to specific project details
  static void navigateToProjectDetail(BuildContext context, String projectId) {
    context.goNamed('project_detail', pathParameters: {'id': projectId});
  }

  static void navigateToProjectStart(BuildContext context, String projectId) {
    context.goNamed('project_start', pathParameters: {'id': projectId});
  }

  // Navigation back to home
  static void navigateToHome(BuildContext context) {
    context.go('/home');
  }

  // Generic back navigation
  static void goBack(BuildContext context) {
    context.pop();
  }
}
