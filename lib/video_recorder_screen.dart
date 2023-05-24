import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

import 'video_player_screen.dart';

class VideoRecorderScreen extends StatefulWidget {
  const VideoRecorderScreen({
    super.key,
  });

  @override
  State<VideoRecorderScreen> createState() => _VideoRecorderScreenState();
}

class _VideoRecorderScreenState extends State<VideoRecorderScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _initializeControllerFuture = _initCamera();
  }

  Future<void> _initCamera() async {
    final cameras = await availableCameras();
    final firstCamera = cameras.firstWhere((camera) {
      return camera.lensDirection == CameraLensDirection.front;
    });

    _controller = CameraController(
      firstCamera,
      ResolutionPreset.medium,
    );

    await _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video recorder screen')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            await _initializeControllerFuture;

            if (!mounted) {
              return;
            }

            if (_isRecording) {
              final video = await _controller.stopVideoRecording();

              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => VideoPlayerScreen(
                    videoPath: video.path,
                  ),
                ),
              );
            } else {
              await _controller.prepareForVideoRecording();
              await _controller.startVideoRecording();
            }

            setState(() {
              _isRecording = !_isRecording;
            });
          } catch (e) {
            print(e);
          }
        },
        child: Icon(_isRecording ? Icons.stop : Icons.circle),
      ),
    );
  }
}