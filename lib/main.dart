import 'dart:io';
import 'package:auvnet_internship_assessment/core/constants/dot_env_keys.dart';
import 'package:auvnet_internship_assessment/core/error/error_app.dart';
import 'package:auvnet_internship_assessment/core/error/exceptions.dart';
import 'package:auvnet_internship_assessment/core/theme/app_theme.dart';
import 'package:auvnet_internship_assessment/features/startup/presentation/screens/startup_screen.dart';
import 'package:auvnet_internship_assessment/injection.dart';
import 'package:auvnet_internship_assessment/routes/routes_generator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Widget appWidget;
  try {
    Hive.init((await getApplicationDocumentsDirectory()).path);
    await Hive.openBox('mybox');

    await dotenv.load();

    await Supabase.initialize(
      anonKey: dotenv.env[API_KEY_ANON_PUBLIC]!,
      url: dotenv.env[PROJECT_URL]!,
    );

    await setupInjection();
    appWidget = NawelApp();
  } catch (e, stackTrace) {
    Failure failure;

    if (e is HiveError) {
      failure = HiveFailure("Hive storage error: ${e.toString()}");
    } else if (e is FileSystemException) {
      failure = HiveFailure("File system error: ${e.toString()}");
    } else if (e.toString().contains('dotenv')) {
      failure = DotEnvFailure("DotEnv load error: ${e.toString()}");
    } else if (e.toString().contains('GetIt')) {
      failure = GetItFailure("Dependency injection error: ${e.toString()}");
    } else {
      failure = UnknownFailure();
    }

    if (kDebugMode) {
      debugPrint(failure.message);
      debugPrint(stackTrace.toString());
    }

    appWidget = ErrorApp(failure: failure);
  }

  runApp(appWidget);
}

class NawelApp extends StatelessWidget {
  const NawelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StartupScreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: AppTheme.lightTheme,
    );
  }
}
