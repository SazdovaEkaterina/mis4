import 'package:flutter/material.dart';
import 'package:new_flutter_project/models/clothing_model.dart';
import 'package:new_flutter_project/widgets/clothing/clothing_card_data.dart';

class ClothingCard extends StatelessWidget {
  final int id;
  final String name;
  final String image;

  const ClothingCard({super.key, required this.id, required this.name, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        splashColor: Colors.red[50],
        onTap: () => {
          Navigator.pushNamed(context, '/details',
          arguments: Clothing(id: id, name: name, image: image))
        },
        child: Container(
          margin: const EdgeInsets.all(5.0),
          padding: const EdgeInsets.all(5.0),
          decoration: BoxDecoration(
              border: Border.all(color: Colors.red.withOpacity(0.8), width: 2),
              borderRadius: BorderRadius.circular(10)
          ),
          child: ClothingCardData(image: image, name: name),
        )
      ),
    );
  }
}