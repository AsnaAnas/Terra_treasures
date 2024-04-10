import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.arrow_circle_left_outlined
        ),
        title: const Text("Kitchen"),
        actions: const [
          Icon(Icons.shopping_bag_outlined)
        ],
      ),
      body:  SingleChildScrollView(
         child: ListView(
            children: [
              
            ],
         ),
      ),
    );
  }
}