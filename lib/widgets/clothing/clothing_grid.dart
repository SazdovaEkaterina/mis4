import 'package:flutter/material.dart';
import 'package:new_flutter_project/models/clothing_model.dart';
import 'package:new_flutter_project/widgets/clothing/clothing_card.dart';

class ClothingGrid extends StatefulWidget {
  final List<Clothing> clothingList;
  const ClothingGrid({super.key, required this.clothingList});

  @override
  State<ClothingGrid> createState() => _ClothingGridState();
}

class _ClothingGridState extends State<ClothingGrid> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(padding: const EdgeInsets.all(4),
        crossAxisCount: 2,
    crossAxisSpacing: 4,
    mainAxisSpacing: 4,
    semanticChildCount: 250,
    childAspectRatio: 200/ 244,
    shrinkWrap: true,
      children: widget.clothingList.map((clothing) => ClothingCard(
        id: clothing.id, name: clothing.name, image: clothing.image,
      )).toList()
    );
  }
}
