import 'package:flutter/material.dart';
import 'package:flutterbasic/IntroPage.dart'; // Ensure this import is correct

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Inventory Management',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(), // Set MyHomePage as the home page
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> products =
      []; // List to store product details

  void _addProduct(Map<String, String> product) {
    setState(() {
      products.add(product); // Add product to the list
    });
  }

  void _clearProducts() {
    setState(() {
      products.clear(); // Clear the product list
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inventory Management'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/bg.png'), // Set the background image
            fit: BoxFit.cover, // Make the image cover the entire background
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IntroPage(
                        addProduct:
                            _addProduct, // Pass the function to IntroPage
                      ),
                    ),
                  );
                },
                child: Text('Enter Product'),
              ),
              SizedBox(height: 20), // Spacing between buttons
              ElevatedButton(
                onPressed: () {
                  // Display the products when "View Products" is pressed
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Products'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: products.isNotEmpty
                                ? products.map((product) {
                                    return Text(
                                      'Name: ${product['name']}, Quantity: ${product['quantity']}, Price: ${product['price']}, Description: ${product['description']}',
                                    );
                                  }).toList()
                                : [Text('No products added yet.')],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Close'),
                          ),
                          TextButton(
                            onPressed: () {
                              _clearProducts(); // Call the function to clear products
                              Navigator.of(context).pop(); // Close the dialog
                            },
                            child: Text('Clear Products'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('View Products'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
