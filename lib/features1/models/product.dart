// ignore_for_file: public_member_api_docs, sort_constructors_first

// Product Model

import 'package:get/state_manager.dart';

class Product {
  final int id;
  final String name;
  final String image;
  final String description;
  final double price;

  Product({
    required this.id,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
  });

  final isFavorite = false.obs;
  final quantity = 1.obs;
}
