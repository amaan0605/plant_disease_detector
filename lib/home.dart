import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:plant_disease_detector/disease_screen.dart';
import 'package:plant_disease_detector/widget.dart';
import 'package:flutter/material.dart';
import 'package:tflite_v2/tflite_v2.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  File? seletectImage;
  //final List _recognitions = [];
  List<dynamic>? result;

  Future pickImagefromGallery() async {
    final galleryImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (galleryImage == null) return;
    setState(() {
      seletectImage = File(galleryImage.path);
    });
    result = await classifyImage(seletectImage!);
    // if (result != null) {
    //   Navigator.push(context,
    //       MaterialPageRoute(builder: (context) => const DiseaseScreen()));
    // }
    return result;
  }

  Future pickImagefromCamera() async {
    final galleryImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (galleryImage == null) return;
    setState(() {
      seletectImage = File(galleryImage.path);
    });
  }

  _loadModel() async {
    Tflite.loadModel(
      model: 'model/model_unquant.tflite',
      labels: 'model/labels.txt',
      numThreads: 1,
    );
  }

  Future classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
        path: image.path,
        imageMean: 0.0,
        imageStd: 255.0,
        numResults: 2,
        threshold: 0.2,
        asynch: true);
    // print('output:$output');
    return output;
    // print('Function called\n\n\n');
    // setState(() {
    //   _recognitions = recognitions;
    // });
  }

  @override
  void initState() {
    super.initState();
    _loadModel();
  }

  @override
  void dispose() {
    super.dispose();
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
                    child: Image.asset(
                      'assets/bg.jpg',
                      fit: BoxFit.cover,
                    )),
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
            GestureDetector(
              onTap: () {
                pickImagefromCamera();
                // if (result != null) {
                //   Navigator.push(
                //       context,
                //       MaterialPageRoute(
                //           builder: (context) => const DiseaseScreen()));
                // }
              },
              child: const ButtonCard(
                headingText: 'Take Picture',
                subText: 'of your plant',
                icon: Icons.camera_enhance,
              ),
            ),
            GestureDetector(
              onTap: () {
                pickImagefromGallery().then((value) => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DiseaseScreen(
                              result: result,
                            ))));
              },
              child: const ButtonCard(
                headingText: 'Import',
                subText: 'from your gallery',
                icon: Icons.import_export,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
