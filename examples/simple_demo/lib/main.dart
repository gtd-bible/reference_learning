import 'package:flutter/material.dart';
import 'package:reference_learning/reference_learning.dart';

void main() {
  runApp(const ReferenceLearningDemoApp());
}

class ReferenceLearningDemoApp extends StatelessWidget {
  const ReferenceLearningDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reference Learning Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Skeleton Driver App'),
              SizedBox(height: 20),
              VerseDisplay(
                verseText: 'This is a placeholder verse to verify integration.',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
