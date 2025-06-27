import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import 'package:compendium/core/viewmodels/home_viewmodel.dart';
import 'package:compendium/core/models/project_model.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Compendium'),
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Consumer<HomeViewModel>(
      builder: (context, homeViewModel, child) {
        return LayoutBuilder(
          builder: (context, constraints) {
            final screenWidth = MediaQuery.of(context).size.width;
            final crossAxisCount = (screenWidth / 300).floor().clamp(1, 5);

            return ScrollConfiguration(
              behavior: ScrollConfiguration.of(context).copyWith(
                dragDevices: {
                  PointerDeviceKind.mouse,
                  PointerDeviceKind.touch,
                  PointerDeviceKind.stylus,
                  PointerDeviceKind.unknown,
                },
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  childAspectRatio: 0.8,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                ),
                padding: const EdgeInsets.all(16.0),
                itemCount: homeViewModel.projects.length,
                itemBuilder: (context, index) {
                  final project = homeViewModel.projects[index];
                  return _buildProjectCard(context, project);
                },
              ),
            );
          },
        );
      },
    );
  }

  /// Builds the complete project card with Hero animation
  Widget _buildProjectCard(BuildContext context, ProjectModel project) {
    return Hero(
      tag: 'project-details-${project.id}',
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildProjectTitle(context, project),
              _buildProjectStatusIcon(context, project),
              _buildProjectDetails(context, project),
            ],
          ),
        ),
      ),
    );
  }

  /// Builds the project title section with fixed height
  Widget _buildProjectTitle(BuildContext context, ProjectModel project) {
    return SizedBox(
      height: 60,
      child: Center(
        child: Text(
          project.title,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headlineSmall,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  /// Builds the project details section (status + button)
  Widget _buildProjectDetails(BuildContext context, ProjectModel project) {
    return Column(
      children: [
        _buildProjectStatusText(context, project),
        SizedBox(height: 16.0),
        _buildProjectButton(context, project),
      ],
    );
  }

  /// Builds the project status indicator text
  Widget _buildProjectStatusText(BuildContext context, ProjectModel project) {
    return Text(
      'Status: ${project.status.toString().split('.').last}'
    );
  }

  /// Builds the project action button
  Widget _buildProjectButton(BuildContext context, ProjectModel project) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: project.status == ProjectStatus.locked
            ? null
            : () {
          context.go('/project/${project.id}');
        },
        child: Text(
          project.status == ProjectStatus.locked ? 'Locked' : 'Open Project',
        ),
      ),
    );
  }

  Widget _buildProjectStatusIcon(BuildContext context, ProjectModel project) {
    return Expanded(
      child: CircleAvatar(
        backgroundColor: project.statusColor,
        child: Icon(
          project.statusIcon,
          color: Colors.white,
        ),
      ),
    );
  }
}
