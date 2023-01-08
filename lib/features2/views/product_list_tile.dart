import 'package:flutter/material.dart';
import 'package:getx_example/features2/models/product_model.dart';

class ProductListTile extends StatelessWidget {
  const ProductListTile({Key? key, required this.product}) : super(key: key);
  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      width: double.infinity,
      child: ListTile(
        //leading: Expanded(child: Image.network(product.imageLink.toString())),
        title: Text(product.name.toString()),
        subtitle: Text(product.description.toString()),
        trailing: Row(
          children: [
            Text(product.rating.toString()),
            const Icon(Icons.star, color: Colors.amber)
          ],
        ),
      ),
    );
  }
}
