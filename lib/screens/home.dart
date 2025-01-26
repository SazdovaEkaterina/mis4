import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/clothing_model.dart';
import '../services/api_service.dart';
import '../widgets/clothing/clothing_grid.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Clothing> clothingList = [];

  @override
  void initState() {
    super.initState();
    getClothingFromAPI();
  }

  void getClothingFromAPI() async {
    ApiService.getClothingFromClothingAPI().then((response) {
      var data = List.from(json.decode(response.body)["results"]);
      setState(() {
        clothingList = data.asMap().entries.map<Clothing>((element) {
          element.value['id'] = element.key + 1;
          element.value['img'] =
              "https://raw.githubusercontent.com/ClothingAPI/sprites/master/sprites/clothing/other/official-artwork/${element.key + 1}.png";
          return Clothing.fromJson(element.value);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent[100],
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.menu, color: Colors.white, size: 24)),
        title: const Text("Clothing App", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.settings, color: Colors.white, size: 24))],
      ),
      body: ClothingGrid(clothingList: clothingList),
    );
  }
}
