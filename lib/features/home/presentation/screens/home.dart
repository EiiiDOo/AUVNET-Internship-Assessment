import 'package:auvnet_internship_assessment/features/authentication/data/data_sources/auth_remote_data_source.dart';
import 'package:auvnet_internship_assessment/features/authentication/data/repositories/auth_repository_impl.dart';
import 'package:auvnet_internship_assessment/injection.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ElevatedButton(
            onPressed: () async {
              await AuthRepositoryImpl(
                localStorage: getIt(),
                networkInfo: getIt(),
                remoteDataSource: getIt(),
              ).signOut();
            },
            child: Text("Sign Out"),
          ),
        ],
      ),
    );
  }
}
