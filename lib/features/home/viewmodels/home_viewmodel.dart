import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:compendium/features/home/models/project_model.dart';

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
      _projects = [
        ProjectModel(id: '1', title: 'Static Anime Collection Display', status: ProjectStatus.completed, coverImagePath: 'assets/images/anime_collection.png', description: 'Display 20 hardcoded anime entries in a responsive grid layout\nEach card must show: title, cover image, genre, rating (1-10)\nImplement smooth scrolling with proper spacing\nCreate custom app bar with "My Anime Collection" title\nApply consistent card styling (rounded corners, shadows)\nEnsure responsive design for multiple screen sizes'),
        ProjectModel(id: '2', title: 'Anime Rating System', status: ProjectStatus.inProgress),
        ProjectModel(id: '3', title: 'Daily Anime Quote Generator', status: ProjectStatus.locked),
        ProjectModel(id: '4', title: 'Movie Watchlist Manager', status: ProjectStatus.locked),
        ProjectModel(id: '5', title: 'TV Show Episode Tracker', status: ProjectStatus.locked),
        ProjectModel(id: '6', title: 'Random Movie Night Picker', status: ProjectStatus.locked),
        ProjectModel(id: '7', title: 'Manga Discovery Engine', status: ProjectStatus.locked),
        ProjectModel(id: '8', title: 'Game Discovery Platform', status: ProjectStatus.locked),
        ProjectModel(id: '9', title: 'Social Book Club Manager', status: ProjectStatus.locked),
        ProjectModel(id: '10', title: 'Anime Character Encyclopedia', status: ProjectStatus.locked)
      ];
      _errorMessage = null;
    } catch (e) {
      _errorMessage = 'Failed to load projects: $e';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
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
