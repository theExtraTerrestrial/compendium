import 'package:compendium/features/home/models/project_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:compendium/features/home/viewmodels/home_viewmodel.dart';
import 'package:compendium/features/home/services/navigation_service.dart';

class ProjectDetailView extends StatefulWidget {
  final String projectId;

  const ProjectDetailView({super.key, required this.projectId});

  @override
  State<ProjectDetailView> createState() => _ProjectDetailViewState();
}

class _ProjectDetailViewState extends State<ProjectDetailView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _panAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 60),
      vsync: this,
    );

    _panAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.linear,
    ));

    // Start the looping animation
    _animationController.repeat();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  Widget _buildProjectDescription(BuildContext context, ProjectModel project) {
    List<String> descriptionLines = project.description?.split('\n') ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: descriptionLines.map((line) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            "- $line",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, homeViewModel, child) {
        final project = homeViewModel.getProjectById(widget.projectId);

        if (project == null) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Project Not Found'),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () => NavigationService.navigateToHome(context),
              ),
            ),
            body: const Center(
              child: Text('Project not found'),
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: Text(project.title),
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => NavigationService.navigateToHome(context),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: 'project-details-${project.id}',
                  child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: project.coverImagePath == null
                            ? project.statusColor.withValues(alpha: 0.2)
                            : null,
                      ),
                      child: Stack(
                        children: [
                          if (project.coverImagePath != null)
                            AnimatedBuilder(
                              animation: _panAnimation,
                              builder: (context, child) {
                                return Container(
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(project.coverImagePath!),
                                      fit: BoxFit.cover,
                                      alignment: Alignment.lerp(
                                        Alignment.topCenter,
                                        Alignment.bottomCenter,
                                        _panAnimation.value,
                                      )!,
                                      colorFilter: ColorFilter.mode(
                                        Colors.black.withValues(alpha: 0.6),
                                        BlendMode.darken,
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
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
                                      child: Text(
                                        'Status: ${project.status.toString().split('.').last}',
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          color: project.coverImagePath != null
                                              ? Colors.white
                                              : null,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Project Details',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        SizedBox(height: 16),
                        _buildProjectDescription(context, project),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Add your project action here
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Starting ${project.title}...')),
                      );
                      NavigationService.navigateToAnimeCollection(context);
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
