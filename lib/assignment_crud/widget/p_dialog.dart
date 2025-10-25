import 'package:flutter/material.dart';

import '../controller/product_controller.dart';
import '../model/product.dart';

class ProductDialog {
  static void open({
    required BuildContext context,
    required bool isUpdate,
    String? id,
    String? productName,
    String? img,
    int? productCode,
    int? qty,
    int? unitPrice,
    int? totalPrice,
    required VoidCallback onCreateOrUpdate,
  }) {
    final TextEditingController nameController = TextEditingController(
      text: productName ?? "",
    );
    final TextEditingController productCodeController = TextEditingController(
      text: productCode?.toString() ?? "",
    );
    final TextEditingController productImgController = TextEditingController(
      text: img ?? "",
    );
    final TextEditingController qtyController = TextEditingController(
      text: qty?.toString() ?? "",
    );
    final TextEditingController unitPriceController = TextEditingController(
      text: unitPrice?.toString() ?? "",
    );
    final TextEditingController totalPriceController = TextEditingController(
      text: totalPrice?.toString() ?? "",
    );

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isUpdate ? "Update Product" : "Create Product"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _field("Product Name", nameController),
                _field("Product Code", productCodeController, number: true),
                _field("Product Image URL", productImgController),
                _field("Product Qty", qtyController, number: true),
                _field("Product Unit Price", unitPriceController, number: true),
                _field(
                  "Product Total Price",
                  totalPriceController,
                  number: true,
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: const Text("Cancel"),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () async {
                        Data product = Data(
                          id,
                          nameController.text,
                          int.tryParse(productCodeController.text) ?? 0,
                          productImgController.text,
                          int.tryParse(qtyController.text) ?? 0,
                          int.tryParse(unitPriceController.text) ?? 0,
                          int.tryParse(totalPriceController.text) ?? 0,
                        );

                        bool success;
                        if (isUpdate) {
                          success = await ProductController.updateProduct(
                            id!,
                            product,
                          );
                        } else {
                          success = await ProductController.createProduct(
                            product,
                          );
                        }

                        if (success) {
                          onCreateOrUpdate();
                          Navigator.pop(context);
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("Operation failed")),
                          );
                        }
                      },
                      child: Text(isUpdate ? "Update" : "Add"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _field(
    String hint,
    TextEditingController controller, {
    bool number = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: const OutlineInputBorder(),
        ),
        keyboardType: number ? TextInputType.number : TextInputType.text,
      ),
    );
  }
}
