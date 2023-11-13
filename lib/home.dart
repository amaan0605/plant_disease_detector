import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:plant_disease_detector/widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? seletectImage;
  Future pickImagefromGallery() async {
    final galleryImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (galleryImage == null) return;
    setState(() {
      seletectImage = File(galleryImage.path);
    });
  }

  Future pickImagefromCamera() async {
    final galleryImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (galleryImage == null) return;
    setState(() {
      seletectImage = File(galleryImage.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 30, bottom: 20),
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Text(
                      'Plant Disease',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Detector',
                      style: TextStyle(fontSize: 20),
                    )
                  ],
                ),
              ),
            ),
            //Main Card
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 300,
                  width: double.infinity,
                  color: Colors.black,
                  child: seletectImage == null
                      ? Image.asset(
                          'assets/bg.jpg',
                          fit: BoxFit.cover,
                        )
                      : Image.file(seletectImage!),
                ),
              ),
            ),
            //Logo placeholder
            const SizedBox(
              height: 100,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Supporting Farmers in',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Safeguarding their crop Health',
                    style: TextStyle(fontSize: 20),
                  )
                ],
              ),
            ),
            //button Card
            const ButtonCard(
              headingText: 'Take Picture',
              subText: 'of your plant',
              icon: Icons.camera_enhance,
            ),
            const ButtonCard(
              headingText: 'Import',
              subText: 'from your gallery',
              icon: Icons.import_export,
            ),
          ],
        ),
      ),
    );
  }
}
