import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:isd_tms/src/core/network/dio/dio_factory.dart';
import 'package:isd_tms/src/core/network/network_info.dart';
import 'package:isd_tms/src/core/helpers/secure_storage_helper.dart';

// Auth
import 'package:isd_tms/src/features/auth/data/service/auth_service.dart';
import 'package:isd_tms/src/features/auth/data/repo/auth_repo.dart';

// Projects
import 'package:isd_tms/src/features/projects/data/service/projects_service.dart';
import 'package:isd_tms/src/features/projects/data/repo/projects_repo.dart';

// Board
import 'package:isd_tms/src/features/board/data/service/board_service.dart';
import 'package:isd_tms/src/features/board/data/repo/board_repo.dart';

final getIt = GetIt.instance;

class DependencyInjection {
  static Future<void> init() async {
    // Shared Preferences
    await SharedPreferences.getInstance();

    // Secure Storage
    const secureStorage = FlutterSecureStorage();
    getIt.registerLazySingleton(() => SecureStorageHelper(secureStorage));

    // Network Info
    getIt.registerLazySingleton<NetworkInfo>(
        () => NetworkInfoImpl(InternetConnectionChecker()));

    // Dio
    getIt.registerLazySingleton<Dio>(() => DioFactory.getDio());

    // --- Auth ---
    getIt.registerLazySingleton(() => AuthService(getIt<Dio>()));
    getIt.registerLazySingleton(() => AuthRepo(getIt<AuthService>()));

    // --- Projects ---
    getIt.registerLazySingleton(() => ProjectsService(getIt<Dio>()));
    getIt.registerLazySingleton(() => ProjectsRepo(getIt<ProjectsService>()));

    // --- Board ---
    getIt.registerLazySingleton(() => BoardService(getIt<Dio>()));
    getIt.registerLazySingleton(() => BoardRepo(getIt<BoardService>()));
  }
}
