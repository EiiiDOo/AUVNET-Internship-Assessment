import 'package:auvnet_internship_assessment/core/constants/dot_env_keys.dart';
import 'package:auvnet_internship_assessment/core/theme/app_theme.dart';
import 'package:auvnet_internship_assessment/features/startup/presentation/screens/startup_screen.dart';
import 'package:auvnet_internship_assessment/injection.dart';
import 'package:auvnet_internship_assessment/routes/routes_generator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Hive.init((await getApplicationDocumentsDirectory()).path);
  await Hive.openBox('mybox');

  await dotenv.load();

  await Supabase.initialize(
    anonKey: dotenv.env[API_KEY_ANON_PUBLIC]!,
    url: dotenv.env[PROJECT_URL]!,
  );

  await setupInjection();

  runApp(NawelApp());
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
