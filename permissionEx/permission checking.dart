import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class checkPermission extends StatefulWidget {

  @override
  State<checkPermission> createState() => _checkPermissionState();
}

class _checkPermissionState extends State<checkPermission> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       title: Text("Permission Checking"),
     ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: requestCameraPermission,
                child: const Text(
                  "Request Camera Permission",
                  style: TextStyle(fontSize: 16,),
                )),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                onPressed: requestMultiplePermissions,
                child: const Text(
                    "Request Multiple Permissions",
                  style: TextStyle(fontSize: 16),
                )),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
                onPressed: RequestPermissionWithOpenSettings,
                child: const Text(
                  "Open Settings",
                  style: TextStyle(fontSize: 16),
                )),
            const SizedBox(
              height: 20.0,
            )
          ],
        ),
      ),
    );
  }

  void requestCameraPermission() async{
    var status = await Permission.camera.status;
    if(status.isGranted){
      ImagePicker picker = ImagePicker();
      picker.pickImage(source: ImageSource.camera);
      print("Permission is Granted");
    }else if (status.isDenied){
      ScaffoldMessenger.of(context);
    }
  }

  void requestMultiplePermissions() async{
    Map<Permission, PermissionStatus> statuses = await[
      Permission.location,
      Permission.storage,
      Permission.phone,
      Permission.photos,
    ].request();
    print("location permission: $statuses[Permission.location]},"
    "storage permission: $statuses[Permission.storage]}");
  }

  void RequestPermissionWithOpenSettings() async{
    openAppSettings();
  }
}
