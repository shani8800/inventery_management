import 'package:flutter/material.dart';

class IntroPage extends StatelessWidget {
  final Function(Map<String, String>) addProduct; // Callback to add product

  const IntroPage({super.key, required this.addProduct});

  @override
  Widget build(BuildContext context) {
    // Text controllers remain the same
    final TextEditingController productNameController = TextEditingController();
    final TextEditingController productQuantityController =
        TextEditingController();
    final TextEditingController productPriceController =
        TextEditingController();
    final TextEditingController productDescriptionController =
        TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Enter Product'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: productNameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: productQuantityController,
              decoration: InputDecoration(labelText: 'Quantity'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: productPriceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: productDescriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add product details to the list and navigate back
                final product = {
                  'name': productNameController.text,
                  'quantity': productQuantityController.text,
                  'price': productPriceController.text,
                  'description': productDescriptionController.text,
                };
                addProduct(product); // Call the addProduct function
                Navigator.pop(context); // Go back to the previous page
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
