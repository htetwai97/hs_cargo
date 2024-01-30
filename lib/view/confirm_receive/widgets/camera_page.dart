// // ignore_for_file: library_private_types_in_public_api
//
// import 'dart:io';
// import 'package:camera/camera.dart';
// import 'package:flutter/material.dart';
// import 'package:hs_cargo_customer_app/core/core_configs/config_dimension.dart';
// import 'package:path_provider/path_provider.dart';
//
// class CameraPage extends StatefulWidget {
//   const CameraPage({super.key});
//
//   @override
//   _CameraPageState createState() => _CameraPageState();
// }
//
// class _CameraPageState extends State<CameraPage> {
//   List<CameraDescription>? cameras;
//   CameraController? controller;
//   File? imageFile;
//   int quarterTurn = 0;
//   CameraDescription? frontCamera;
//   CameraDescription? normalCamera;
//   @override
//   void initState() {
//     super.initState();
//     getCameras().then((_) {
//       initCamera();
//     });
//   }
//
//   Future<void> getCameras() async {
//     cameras = await availableCameras();
//     normalCamera = cameras?[0];
//     frontCamera = cameras?.firstWhere(
//         (camera) => camera.lensDirection == CameraLensDirection.front);
//   }
//
//   void initCamera() {
//     controller = CameraController(normalCamera!, ResolutionPreset.medium);
//     controller?.initialize().then((_) {
//       if (!mounted) {
//         return;
//       }
//       setState(() {});
//     });
//   }
//
//   void changeCameraRotation() {
//     controller = CameraController(frontCamera!, ResolutionPreset.medium);
//     controller?.initialize().then((_) {
//       if (!mounted) {
//         return;
//       }
//       setState(() {});
//     });
//   }
//
//   void startCamera() async {
//     if (controller != null && !controller!.value.isInitialized) {
//       controller?.initialize().then((_) {
//         if (!mounted) {
//           return;
//         }
//         setState(() {});
//       });
//     } else {
//       final path = (await getTemporaryDirectory()).path;
//       final fileName = DateTime.now().millisecondsSinceEpoch.toString();
//       final filePath = '$path/$fileName.jpg';
//       XFile image = await controller!.takePicture();
//       await image.saveTo(filePath);
//       imageFile = File(image.path);
//
//       setState(() {});
//     }
//   }
//
//   void stopCamera() {
//     controller?.stopImageStream();
//   }
//
//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     if (controller == null || !controller!.value.isInitialized) {
//       return Container();
//     }
//     return Column(
//       children: [
//         SizedBox(height: scaleWidth(context) / 10),
//         Stack(
//           children: [
//             RotatedBox(
//               quarterTurns: quarterTurn,
//               child: CameraPreview(controller!),
//             ),
//             Card(
//               color: Colors.transparent,
//               child: IconButton(
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//                 icon: const Icon(
//                   Icons.arrow_back_ios,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: scaleWidth(context) / 10),
//         Padding(
//           padding: EdgeInsets.symmetric(horizontal: scaleWidth(context) / 20),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               imageFile != null
//                   ? MaterialButton(
//                       onPressed: () {},
//                       child: CircleAvatar(
//                         radius: 28,
//                         backgroundImage: FileImage(imageFile!),
//                       ),
//                     )
//                   : MaterialButton(
//                       onPressed: () {},
//                       child: const CircleAvatar(
//                         radius: 28,
//                         backgroundImage:
//                             AssetImage("assets/images/grey_camera.jpg"),
//                       ),
//                     ),
//               const Spacer(),
//               MaterialButton(
//                 padding: EdgeInsets.all(scaleWidth(context) / 25),
//                 color: Colors.blue,
//                 shape: const CircleBorder(),
//                 enableFeedback: true,
//                 onPressed: startCamera,
//                 child: const Icon(
//                   Icons.camera,
//                   size: 30,
//                   color: Colors.white,
//                 ),
//               ),
//               const Spacer(),
//               (controller?.description == normalCamera)
//                   ? MaterialButton(
//                       padding: EdgeInsets.all(scaleWidth(context) / 25),
//                       shape: const CircleBorder(),
//                       color: Colors.white70,
//                       onPressed: () {
//                         changeCameraRotation();
//                       },
//                       child: const Icon(Icons.cameraswitch_outlined),
//                     )
//                   : MaterialButton(
//                       padding: EdgeInsets.all(scaleWidth(context) / 25),
//                       shape: const CircleBorder(),
//                       color: Colors.white70,
//                       onPressed: () {
//                         initCamera();
//                       },
//                       child: const Icon(Icons.cameraswitch_outlined),
//                     )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
// }
