import 'dart:io';
import 'package:flutter/material.dart';

class DiseaseScreen extends StatefulWidget {
  const DiseaseScreen({super.key, required this.result, required this.image});
  final List<dynamic>? result;
  final File? image;

  @override
  State<DiseaseScreen> createState() => _DiseaseScreenState();
}

class _DiseaseScreenState extends State<DiseaseScreen> {
  String? possibleCauses = 'Possible Cause';
  String? possibleSolution = 'Possible Solution';

  void diseaseCase() {
    switch (widget.result![0]['label']) {
      case "Pepper Bell Bacterial Spot":
        possibleCauses =
            "Caused by Xanthomonas bacteria, spread through splashing rain.";
        possibleSolution =
            "Spray early and often. Use copper and Mancozeb sprays.";
        break;

      case "Pepper Bell Healthy":
        possibleCauses = "Crops are okay.";
        possibleSolution = "N/A";
        break;

      case "Potato Early Blight":
        possibleCauses =
            "The fungus Alternaria solani, high humidity and long periods of leaf wetness.";
        possibleSolution =
            "Maintaining optimum growing conditions: proper fertilization, irrigation, and pests management.";
        break;

      case "Potato Healthy":
        possibleCauses = "Crops are okay.";
        possibleSolution = "N/A";
        break;

      case "Potato Late Blight":
        possibleCauses =
            "Occurs in humid regions with temperatures ranging between 4 and 29 °C.";
        possibleSolution =
            "Eliminating cull piles and volunteer potatoes, using proper harvesting and storage practices, and applying fungicides when necessary.";
        break;

      case "Tomato Bacterial Spot":
        possibleCauses =
            "Xanthomonas bacteria which can be introduced into a garden on contaminated seed and transplants, which may or may not show symptoms.";
        possibleSolution =
            "Remove symptomatic plants from the field or greenhouse to prevent the spread of bacteria to healthy plants.";
        break;

      case "Tomato Early Blight":
        possibleCauses =
            "The fungus Alternaria solani, high humidity and long periods of leaf wetness.";
        possibleSolution =
            "Maintaining optimum growing conditions: proper fertilization, irrigation, and pests management.";
        break;

      case "Tomato Healthy":
        possibleCauses = "Crops are okay.";
        possibleSolution = "N/A";
        break;

      case "Tomato Late Blight":
        possibleCauses = "Caused by the water mold Phytophthora infestans.";
        possibleSolution = "Timely application of fungicide";
        break;

      case "Tomato Leaf Mold":
        possibleCauses = "High relative humidity (greater than 85%).";
        possibleSolution =
            "Growing leaf mold resistant varieties, use drip irrigation to avoid watering foliage.";
        break;

      case "Tomato Septoria Leaf Spot":
        possibleCauses =
            "It is a fungus and spreads by spores most rapidly in wet or humid weather. Attacks plants in the nightshade family, and can be harbored on weeds within this family.";
        possibleSolution =
            "Remove infected leaves immediately, use organic fungicide options.";
        break;

      case "Tomato Spotted Spider Mites":
        possibleCauses =
            "Spider mite feeding on leaves during hot and dry conditions.";
        possibleSolution =
            "Aiming a hard stream of water at infested plants to knock spider mites off the plants. Also use of insecticidal soaps, horticultural oils.";
        break;

      case "Tomato Target Spot":
        possibleCauses =
            "The fungus Corynespora cassiicola which spreads to plants.";
        possibleSolution =
            "Planting resistant varieties, keeping farms free from weeds.";
        break;

      case "Tomato Mosaic Virus":
        possibleCauses =
            "Spread by aphids and other insects, mites, fungi, nematodes, and contact; pollen and seeds can carry the infection as well.";
        possibleSolution =
            "No cure for infected plants, remove all infected plants and destroy them.";
        break;

      case "Tomato Yellow Leaf Curl Virus":
        possibleCauses =
            "Physically spread plant-to-plant by the silverleaf whitefly.";
        possibleSolution =
            "Chemical control: Imidacloprid should be sprayed on the entire plant and below the leaves.";
        break;

      default:
        possibleCauses = "N/A";
        possibleSolution = "N/A";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    diseaseCase();
    return Scaffold(
        //backgroundColor: Colors.grey,
        appBar: AppBar(
          title: const Text(
            'Plant Disease Detector',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 10.0, right: 10.0, top: 20.0, bottom: 10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    height: 300,
                    width: double.infinity,
                    color: Colors.black,
                    child: Image.file(
                      widget.image!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Disease Name',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    widget.result![0]['label'],
                    style: const TextStyle(fontSize: 18, letterSpacing: 1),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Possible Cause',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      possibleCauses!,
                      textAlign: TextAlign.center,
                      //widget.result![0]['confidence'].toString(),
                      style: const TextStyle(fontSize: 18, letterSpacing: 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 50),
              Column(
                //mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Possible Solution',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    possibleSolution!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 18, letterSpacing: 1),
                  ),
                ],
              ),
              const SizedBox(height: 50),
            ],
          ),
        ));
  }
}
