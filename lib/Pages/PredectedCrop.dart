import 'package:agriboost/components/CropsCard.dart';
import 'package:flutter/material.dart';

class Predictedcrops extends StatelessWidget {
  const Predictedcrops({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Predicted Crops"),
          backgroundColor: Colors.green[300],
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                CropsCard(
                    CropName: "Cucumber",
                    img:
                        "https://media.istockphoto.com/id/801181496/photo/cucumbers-in-a-trailer-after-harvest-small-green-freshly-harvested-gherkins.jpg?s=612x612&w=0&k=20&c=Eainstty_8oRFel8pqXjbxqOAbbSfYn3RcMPid2OOAE="),
                CropsCard(
                    CropName: "Watermelon",
                    img:
                        "https://t3.ftcdn.net/jpg/12/36/19/80/360_F_1236198043_yxOyoiobMdzKPACH9Od6LRyOrS4Y33E3.jpg"),
                CropsCard(
                    CropName: "MuskMelon",
                    img:
                        "https://upaj.ag/cdn/shop/articles/Muskmelon.png?v=1724846923&width=1100"),
                CropsCard(
                    CropName: "Brinjal",
                    img:
                        "https://thumbs.dreamstime.com/b/eggplant-field-crop-many-aubergines-aubergine-agriculture-landscape-vegetable-farm-drawing-imitation-generative-ai-illustration-340630187.jpg"),
                CropsCard(
                    CropName: "Tomato",
                    img:
                        "https://t3.ftcdn.net/jpg/04/61/83/04/360_F_461830482_jIMqGFHFcQWE3mt8QLjT1Fot3TvEu8cg.jpg")
              ],
            ),
          ),
        ));
  }
}
