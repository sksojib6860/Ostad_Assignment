import 'package:flutter/material.dart';
import 'package:module_13_assignment/assignment_crud/widget/p_card.dart';
import 'package:module_13_assignment/assignment_crud/widget/p_dialog.dart';

import 'controller/product_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> loadData() async {
    await ProductController.getProducts();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange[400],
        foregroundColor: Colors.white,
        onPressed: () {
          ProductDialog.open(
            context: context,
            isUpdate: false,
            onCreateOrUpdate: loadData,
          );
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text("CRUD Assignment"),
      ),
      body: SafeArea(
        child: ProductController.products.isEmpty
            ? const Center(child: CircularProgressIndicator(color: Colors.red))
            : GridView.builder(
                padding: const EdgeInsets.all(10),
                itemCount: ProductController.products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 5,
                  crossAxisSpacing: 5,
                  crossAxisCount: 2,
                  childAspectRatio: 0.760,
                ),
                itemBuilder: (context, index) {
                  var singleProduct = ProductController.products[index];
                  return ProductCard(
                    id: singleProduct.sId,
                    totalPrice: singleProduct.totalPrice ?? 0,
                    qty: singleProduct.qty ?? 0,
                    productName: singleProduct.productName ?? "No name",
                    img: singleProduct.img ?? "",
                    onDelete: () async {
                      await ProductController.deleteProduct(singleProduct.sId!);
                      loadData();
                    },
                    onEdit: () {
                      ProductDialog.open(
                        context: context,
                        isUpdate: true,
                        id: singleProduct.sId,
                        productName: singleProduct.productName,
                        productCode: singleProduct.productCode,
                        img: singleProduct.img,
                        qty: singleProduct.qty,
                        unitPrice: singleProduct.unitPrice,
                        totalPrice: singleProduct.totalPrice,
                        onCreateOrUpdate: loadData,
                      );
                    },
                  );
                },
              ),
      ),
    );
  }
}
