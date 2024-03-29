import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:get/get.dart';
import 'package:camera/camera.dart';

class CameraManager {
  List<CameraDescription>? cameras;
  CameraController? _controller;

  Future<CameraController?> load() async {
    cameras = await availableCameras();
    //Set front camera if available or back if not available
    int position = cameras!.isNotEmpty ? 1 : 0;
    _controller = CameraController(
      cameras![position],
      ResolutionPreset.medium,
      enableAudio: false,
    );
    await _controller?.initialize();
    return _controller;
  }

  CameraController? get controller => _controller;
}