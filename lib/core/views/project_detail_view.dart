import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:compendium/core/viewmodels/home_viewmodel.dart';
import 'package:compendium/core/models/project_model.dart';

class ProjectDetailView extends StatelessWidget {
  final String projectId;

  const ProjectDetailView({super.key, required this.projectId});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, homeViewModel, child) {
        final project = homeViewModel.projects.firstWhere(
          (p) => p.id == projectId,
          orElse: () => throw Exception('Project not found'),
        );

        return Scaffold(
          appBar: AppBar(
            title: Text(project.title),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                context.go('/home');
              },
            )
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'project-details-${project.id}',
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: project.statusColor,
                                child: Icon(
                                  project.statusIcon,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      project.title,
                                      style: Theme.of(context).textTheme.headlineSmall,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Status: ${project.status.toString().split('.').last}',
                                      style: Theme.of(context).textTheme.bodyLarge,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  'Project Details',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 16),
                Text(
                  'This is where you can add more details about the project, implement features, or show project-specific content.',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Spacer(),
                if (project.status == ProjectStatus.inProgress)
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        // Add your project action here
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Starting ${project.title}...')),
                        );
                      },
                      child: Text('Start Project'),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}
