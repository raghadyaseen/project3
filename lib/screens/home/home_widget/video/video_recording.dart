// TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

class VideoRecordingScreen extends StatefulWidget {
  const VideoRecordingScreen({Key? key}) : super(key: key);

  @override
  _VideoRecordingScreenState createState() => _VideoRecordingScreenState();
}

class _VideoRecordingScreenState extends State<VideoRecordingScreen> {
  late CameraController _controller;
  bool _isRecording = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameras = await availableCameras();
    _controller = CameraController(cameras[0], ResolutionPreset.medium);
    await _controller.initialize();
    setState(() {});
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _sendVideoToAPI() async {
    // إرسال الفيديو إلى API هنا
    Navigator.pushNamed(context, '/loading');
  }

  @override
  Widget build(BuildContext context) {
    if (!_controller.value.isInitialized) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }
    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل الفيديو')),
      body: Column(
        children: [
          Expanded(
            child: CameraPreview(_controller),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() => _isRecording = !_isRecording);
                _isRecording ? _controller.startVideoRecording() : _controller.stopVideoRecording();
                if (!_isRecording) _sendVideoToAPI();
              },
              child: Text(_isRecording ? 'إيقاف التسجيل' : 'بدء التسجيل'),
            ),
          ),
        ],
      ),
    );
  }
}