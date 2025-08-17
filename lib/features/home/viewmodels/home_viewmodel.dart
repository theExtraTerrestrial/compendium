import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:compendium/features/home/models/project_model.dart';
import 'package:compendium/features/home/models/project_status.dart';
import 'package:compendium/features/feature_registry.dart' as registry;
import 'package:compendium/features/feature_config.dart';

class HomeViewModel extends ChangeNotifier {
  List<ProjectModel> _projects = [];
  bool _isLoading = false;
  String? _errorMessage;

  // Getters
  UnmodifiableListView<ProjectModel> get projects => UnmodifiableListView(_projects);
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;
  bool get hasError => _errorMessage != null;

  HomeViewModel.initial() {
    _initializeProjects();
  }

  void _initializeProjects() {
    _isLoading = true;
    notifyListeners();

    try {
      // Build projects list from the central feature registry.
      _projects = registry.featureRegistry.map(_projectFromFeature).toList();
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Failed to load projects: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  ProjectModel _projectFromFeature(FeatureConfig f) {
    final metadata = f.metadata;
    final status = metadata?.status ?? ProjectStatus.locked;

    final title = metadata?.title ?? f.name.replaceAll('_', ' ').split(' ').map((s) => s.isEmpty ? s : '${s[0].toUpperCase()}${s.substring(1)}').join(' ');

    return ProjectModel(
      id: f.id,
      title: title,
      status: status,
      coverImagePath: metadata?.coverImagePath,
      description: metadata?.description,
    );
  }

  void addProject(ProjectModel project) {
    _projects.add(project);
    notifyListeners();
  }

  void updateProjectStatus(String id, ProjectStatus status) {
    final index = _projects.indexWhere((project) => project.id == id);
    if (index != -1) {
      _projects[index] = ProjectModel(
        id: _projects[index].id,
        title: _projects[index].title,
        status: status
      );
      notifyListeners();
    }
  }

  ProjectModel? getProjectById(String id) {
    try {
      return _projects.firstWhere((project) => project.id == id);
    } catch (e) {
      return null;
    }
  }

  void refreshProjects() {
    _initializeProjects();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }
}
