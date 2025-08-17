import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:compendium/features/home/viewmodels/home_viewmodel.dart';
import 'package:compendium/features/home/models/project_model.dart';
import 'package:compendium/features/home/models/project_status.dart';
import 'package:compendium/features/home/services/navigation_service.dart';

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
        // Handle loading state
        if (homeViewModel.isLoading) {
          return _buildLoadingState();
        }

        // Handle error state
        if (homeViewModel.hasError) {
          return _buildErrorState(context, homeViewModel);
        }

        // Handle success state with projects grid
        return _buildProjectsGrid(context, homeViewModel);
      },
    );
  }

  /// Builds the loading state UI
  Widget _buildLoadingState() {
    return const Center(child: CircularProgressIndicator());
  }

  /// Builds the error state UI with retry functionality
  Widget _buildErrorState(BuildContext context, HomeViewModel homeViewModel) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            homeViewModel.errorMessage!,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: homeViewModel.refreshProjects,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }

  /// Builds the main projects grid UI
  Widget _buildProjectsGrid(BuildContext context, HomeViewModel homeViewModel) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final screenWidth = MediaQuery.of(context).size.width;
        final crossAxisCount = (screenWidth / 300).floor().clamp(1, 5);

        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            childAspectRatio: 0.7,
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          padding: const EdgeInsets.all(16.0),
          itemCount: homeViewModel.projects.length,
          itemBuilder: (context, index) {
            final project = homeViewModel.projects[index];
            return _buildProjectCard(context, project);
          },
        );
      },
    );
  }

  /// Builds the complete project card with Hero animation
  Widget _buildProjectCard(BuildContext context, ProjectModel project) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 3,
            child: _buildProjectImage(context, project),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildProjectTitle(context, project),
                const SizedBox(height: 16.0),
                _buildProjectDetails(context, project),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectImage(BuildContext context, ProjectModel project) {
    return project.coverImagePath != null
        ? Image.asset(
            project.coverImagePath!,
            fit: BoxFit.cover
          )
        : FlutterLogo(
            size: 400,
            style: FlutterLogoStyle.markOnly
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

  /// Builds the project details section (status text + button)
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
    return Chip(
      backgroundColor: Color.lerp(project.statusColor, Colors.black, 0.3),
      side: BorderSide(
        color: Color.lerp(project.statusColor, Colors.white, 0.2)!,
        width: 1,
      ),
      label: Text(
        project.status.toString().split('.').last,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  /// Builds the project action button
  Widget _buildProjectButton(BuildContext context, ProjectModel project) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          // Navigate to the actual project or project detail view
          NavigationService.navigateToProjectDetail(context, project.id);
        },
        child: Text(
          project.status == ProjectStatus.locked ? 'Locked' : 'Open Project',
        ),
      ),
    );
  }
}
