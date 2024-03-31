import 'package:ai_ewaste/controller/scan_controller.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class Cameraview extends StatelessWidget {
  const Cameraview({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ScanController>(
        init: ScanController(),
          builder:  (controller){
            return controller.isCameraInitialized.value ? Stack(
              children: [
                CameraPreview(controller.cameraController),
                Positioned(
                  top: controller.y * MediaQuery.of(context).size.height,
                  right: controller.x * MediaQuery.of(context).size.width,
                  child: Container(
                    width: controller.w * MediaQuery.of(context).size.width,
                    height: controller.h * MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.green, width: 3.0)
                    ),
                    child: Column(
                      children: [
                        Container(
                          color: Colors.white,
                          child: Text(controller.label),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ) : Center(child: Text("Loading preview of camera..."));
          }
      )
    );
  }
}
