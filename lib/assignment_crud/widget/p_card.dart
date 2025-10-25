import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  final String img;
  final String productName;
  final int totalPrice;
  final int qty;
  final String? id;
  final VoidCallback onDelete;
  final VoidCallback onEdit;

  const ProductCard({
    super.key,
    required this.img,
    required this.productName,
    required this.totalPrice,
    required this.qty,
    required this.id,
    required this.onDelete,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.network(
              height: 100,
              img.startsWith("http")
                  ? img
                  : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbKNeVHxSwGdiF7nCCIKZeGgDKh7aS3h9jDw&s",
            ),
            Text(
              productName.length > 17
                  ? "${productName.substring(0, 17)}."
                  : productName,
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  totalPrice.toString().length > 3
                      ? "price : ${totalPrice.toString().substring(0, 3)}"
                      : "price : ${totalPrice.toString()}",
                ),
                Text("Qty: $qty"),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  color: Colors.red,
                  onPressed: onDelete,
                  icon: const Icon(Icons.delete),
                ),
                IconButton(
                  color: Colors.blue,
                  onPressed: onEdit,
                  icon: const Icon(Icons.edit),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
