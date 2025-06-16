import 'package:auvnet_internship_assessment/core/constants/storage_keys.dart';
import 'package:auvnet_internship_assessment/injection.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () async {
            await getIt<Box>().delete(StorageKeys.firstTime.name);
          },
          child: Text("delete first time"),
        ),
      ),
    );
  }
}
