import 'package:agriboost/Pages/cropDetailPage.dart';
import 'package:agriboost/components/CropsCard.dart';
import 'package:agriboost/models/crops.dart';
import 'package:flutter/material.dart';

class Predictedcrops extends StatelessWidget {
  const Predictedcrops({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(8.0),
      child: ListView.builder(
          itemCount: crops.length,
          itemBuilder: (context, index) {
            final crop = crops[index];
            return GestureDetector(
                onTap: () {
                  final Crop? predictedCrop = crops.firstWhere(
                    (crop) => crop.name == crop.name,
                    orElse: () => Crop(
                      id: '',
                      name: '',
                      imageUrl: '',
                      description: '',
                    ),
                  );

                  if (predictedCrop != null) {
                    // Navigate to the Cropdetailpage with the predicted crop
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Cropdetailpage(crop: crop),
                      ),
                    );
                  } else {
                    // Handle case where the crop is not found
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Crop details not found for ')),
                    );
                  }
                },
                child: CropsCard(CropName: crop.name, img: crop.imageUrl));
          }),
    ));
  }
}
