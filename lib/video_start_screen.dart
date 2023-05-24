import 'package:first_project/video_recorder_screen.dart';
import 'package:flutter/material.dart';


class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Start screen')),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            child: const Text('Camera'),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const VideoRecorderScreen(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}