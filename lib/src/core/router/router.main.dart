import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/di/dependency_injection.dart';
import 'package:isd_tms/src/features/auth/data/repo/auth_repo.dart';
import 'package:isd_tms/src/features/auth/presentation/bloc/login_cubit.dart';
import 'package:isd_tms/src/features/auth/presentation/views/screens/login_screen.dart';
import 'package:isd_tms/src/features/board/data/models/members_screen_args.dart';
import 'package:isd_tms/src/features/board/data/repo/board_repo.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/views/screens/board_screen.dart';
import 'package:isd_tms/src/features/board/presentation/views/screens/members/members_screen.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/screens/task_detail_screen.dart';
import 'package:isd_tms/src/features/projects/data/models/project_model.dart';
import 'package:isd_tms/src/features/task_details/data/models/task_detail_args.dart';
import 'package:isd_tms/src/features/projects/data/repo/projects_repo.dart';
import 'package:isd_tms/src/features/projects/presentation/bloc/projects_cubit.dart';
import 'package:isd_tms/src/features/projects/presentation/views/screens/projects_screen.dart';
import 'package:isd_tms/src/features/splash/presentation/views/splash_screen.dart';

part 'router.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final arguments = settings.arguments;
    switch (settings.name) {
      case Routes.initial:
        return _buildRoute(const SplashScreen(), settings);
      //--------------------------------------------------------------------
      case Routes.login:
        return _buildRoute(
          BlocProvider(
            create: (_) => LoginCubit(getIt<AuthRepo>()),
            child: const LoginScreen(),
          ),
          settings,
        );
      //--------------------------------------------------------------------

      case Routes.projects:
        return _buildRoute(
          BlocProvider(
            create: (_) => ProjectsCubit(getIt<ProjectsRepo>())..getProjects(),
            child: const ProjectsScreen(),
          ),
          settings,
        );
      //--------------------------------------------------------------------

      case Routes.board:
        final project = arguments as ProjectModel;
        return _buildRoute(
          BlocProvider(
            create: (_) => BoardCubit(getIt<BoardRepo>())..getBoard(project.id),
            child: BoardScreen(project: project),
          ),
          settings,
        );
      //--------------------------------------------------------------------
      case Routes.taskDetail:
        final args = arguments as TaskDetailArgs;
        return _buildRoute(
          BlocProvider(
            create: (context) =>
                getIt<TaskDetailsCubit>()..updateCurrentCard(args.card)
                  ..getCardDetails(),
            child: BlocProvider.value(
              value: args.boardCubit,
              child: TaskDetailScreen(
                card: args.card,
              ),
            ),
          ),
          settings,
        );
      //--------------------------------------------------------------------
      case Routes.members:
        final args = arguments as MembersScreenArgs;
        return _buildRoute(MembersScreen(args: args), settings);
      //--------------------------------------------------------------------

      default:
        return null;
    }
  }

  static Route<dynamic> _buildRoute(Widget child, RouteSettings settings) {
    if (Platform.isIOS) {
      return CupertinoPageRoute(builder: (_) => child, settings: settings);
    } else {
      return PageRouteBuilder(
        settings: settings,
        pageBuilder: (context, animation, secondaryAnimation) => child,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(opacity: animation, child: child);
        },
      );
    }
  }
}
