import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:compendium/core/models/project_model.dart';

class HomeViewModel extends ChangeNotifier {
  List<ProjectModel> _projects = [];
  UnmodifiableListView<ProjectModel> get projects => UnmodifiableListView(_projects);

  HomeViewModel.initial() {
    _projects = [
      ProjectModel(id: '1', title: 'Static Anime Collection Display', status: ProjectStatus.inProgress),
      ProjectModel(id: '2', title: 'Anime Rating System', status: ProjectStatus.locked),
      ProjectModel(id: '3', title: 'Daily Anime Quote Generator', status: ProjectStatus.locked),
      ProjectModel(id: '4', title: 'Movie Watchlist Manager', status: ProjectStatus.locked),
      ProjectModel(id: '5', title: 'TV Show Episode Tracker', status: ProjectStatus.locked),
      ProjectModel(id: '6', title: 'Random Movie Night Picker', status: ProjectStatus.locked),
      ProjectModel(id: '7', title: 'Manga Discovery Engine', status: ProjectStatus.locked),
      ProjectModel(id: '8', title: 'Game Discovery Platform', status: ProjectStatus.locked),
      ProjectModel(id: '9', title: 'Social Book Club Manager', status: ProjectStatus.locked),
      ProjectModel(id: '10', title: 'Anime Character Encyclopedia', status: ProjectStatus.locked)
    ];
  }

  void addProject(ProjectModel project) {
    _projects.add(project);
    notifyListeners();
  }

  void updateProjectStatus(String id, ProjectStatus status) {
    final index = _projects.indexWhere((project) => project.id == id);
    if (index != -1) {
      _projects = [..._projects.sublist(0, index - 1),
                   ProjectModel(id: id, title: _projects[index].title, status: status),
                   ..._projects.sublist(index + 1)];
      notifyListeners();
    }
  }
}
