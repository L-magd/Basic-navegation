import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Combined Navigation App',
      home: HomeScreen(),
    );
  }
}


/// HOME SCREEN (Exercise 1)

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(
        child: ElevatedButton(
          child: Text("Go to Product List"),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductListScreen(),
              ),
            );
          },
        ),
      ),
    );
  }
}


/// PRODUCT LIST SCREEN (Exercise 2)

class ProductListScreen extends StatelessWidget {
  final List<String> products = ["Laptop", "Phone", "Headphones"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product List")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(products[index]),
            onTap: () async {
              // 🔹 PUSH + SEND DATA
              final result = await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ProductDetailsScreen(
                    productName: products[index],
                  ),
                ),
              );

              // 🔹 SHOW RESULT IN SNACKBAR
              if (result != null) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(result)),
                );
              }
            },
          );
        },
      ),
    );
  }
}


/// PRODUCT DETAILS SCREEN (Exercise 2)

class ProductDetailsScreen extends StatelessWidget {
  final String productName;

  ProductDetailsScreen({required this.productName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Product: $productName"),
            SizedBox(height: 20),
            ElevatedButton(
              child: Text("Add to Favorites"),
              onPressed: () {
                // 🔹 RETURN RESULT
                Navigator.pop(context, "Added to favorites");
              },
            ),
          ],
        ),
      ),
    );
  }
}