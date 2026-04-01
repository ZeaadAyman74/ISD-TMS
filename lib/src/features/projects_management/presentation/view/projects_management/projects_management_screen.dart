import 'package:flutter/material.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class ProjectsManagementScreen extends StatelessWidget {
  const ProjectsManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.localization.projects_management),
      ),
    );
  }
}
