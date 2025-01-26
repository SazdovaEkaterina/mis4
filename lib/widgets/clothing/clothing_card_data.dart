
import 'package:flutter/material.dart';

class ClothingCardData extends StatelessWidget {
  final String image;
  final String name;

  const ClothingCardData({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {

    return Column(mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(child: Image.network(image, fit: BoxFit.contain)),
        const Divider(),
        Text(name, style: const TextStyle(
            color: Colors.black54, fontSize: 20, fontWeight: FontWeight.w600
        ),)
      ],
    );
  }
}