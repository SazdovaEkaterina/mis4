import 'package:flutter/material.dart';
import 'package:new_flutter_project/models/clothing_model.dart';
import 'package:new_flutter_project/services/api_service.dart';

import '../models/ability_model.dart';
import '../widgets/details/detail_back_button.dart';
import '../widgets/details/detail_data.dart';
import '../widgets/details/detail_image.dart';
import '../widgets/details/detail_title.dart';

class Details extends StatefulWidget {
  const Details({super.key});

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  Clothing clothing = Clothing(abilities: []);
  String id = '';

  // @override
  // void initState() {
  //   super.initState();
  //   getAbilities();
  // }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments as Clothing;
    id = arguments.id.toString();
    print("id: $id");
    if (id.isNotEmpty) {
      getAbilities(id);
    }
  }

  void getAbilities(String id) async {
    ApiService.getAbilitiesForClothing(id).then((response){
      print("response: $response");
      setState(() {
        clothing = Clothing.fromJson(response);
      });
    }).catchError((error){
      print("Error: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context)?.settings.arguments as Clothing;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(mainAxisSize: MainAxisSize.min,
          children: [
            DetailImage(image: arguments.image),
            DetailTitle(id: arguments.id, name: arguments.name),
            DetailData(id: arguments.id, clothing: clothing),
          ],
        ),
      ),
      floatingActionButton: const DetailBackButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
    );
  }
}
