import 'package:flutter/material.dart';
import 'package:camera/camera.dart';


class camera extends StatefulWidget {
  const camera({Key? key}) : super(key: key);

  @override
  State<camera> createState() => _cameraState();
}
class _cameraState extends State<camera> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;




  @override
  void initState() {
    startCamera(0);
    super.initState();
  }

  void startCamera(int direction ) async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras[direction],
      ResolutionPreset.high,
      enableAudio: false,
    );
    await cameraController.initialize().then((value) {
      if (!mounted) {
        return;
      }
      setState(() {}); //to refresh widget

    }).catchError((e) {
      print(e);
    });
  }

  @override
  void dispose() {
    cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (cameraController.value.isInitialized) {
      return Scaffold(
        body: Stack(
          children: [
            CameraPreview(cameraController),
            GestureDetector(
              onTap: (){
                /*
                setState(() {
                   direction = direction ==0 ? 1: 0;
                  startCamera(direction);
                });*/
              },
              child:button(Icons.flip_camera_android_outlined, Alignment.bottomLeft),
            ),
            GestureDetector(
              onTap: (){
                cameraController.takePicture().then((XFile? file){
                  if(mounted){
                    if (file != null){
                      print("picture saved to${file.path}");
                    }
                  }
                });
              },
              child:button(Icons.camera_alt_outlined, Alignment.bottomCenter),

            ),





          ],
        ),

      );
    }
    else {
      return const SizedBox();
    }
  }
  Widget button (IconData icon , Alignment alignment){
    return Align(
      alignment: alignment,
      child: Container(
        margin: EdgeInsets.only(
          left: 20,
          bottom: 20,
        ),
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(2,2),
              blurRadius: 10,
            ),
          ],
        ),
        child: Center(
          child: Icon(
            icon,
            color: Colors.black54,
          ),
        ),
      ),
    );
  }
}