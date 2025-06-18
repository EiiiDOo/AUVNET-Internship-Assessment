import 'package:auvnet_internship_assessment/core/error/exceptions.dart';
import 'package:flutter/material.dart';

class ErrorApp extends StatelessWidget {
  final Failure failure;

  const ErrorApp({super.key, required this.failure});

  @override
  Widget build(BuildContext context) {
    final message = failure.message;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Startup Error')),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 48, color: Colors.red),
              SizedBox(height: 16),
              Text(
                'Something went wrong while starting the app.',
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                message,
                style: TextStyle(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  // TODO: Restart App
                },
                child: Text('Retry'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
