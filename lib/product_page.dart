import 'package:flutter/material.dart';
import 'package:pertemuan7/cart_model.dart';
import 'package:pertemuan7/cart_page.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatelessWidget {
  ProductPage({super.key});

  final products = [
    Product(
      'Laptop',
      'https://plus.unsplash.com/premium_photo-1681566925246-cc584a44d7fe?w=500&auto=format&fit=crop&q=60',
    ),
    Product(
      'Mouse',
      'https://images.unsplash.com/photo-1527814050087-3793815479db?w=500&auto=format&fit=crop&q=60',
    ),
    Product(
      'Monitor',
      'https://images.unsplash.com/photo-1551645120-d70bfe84c826?w=500&auto=format&fit=crop&q=60',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Toko Pedia'),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Consumer<CartModel>(
              builder: (context, cart, child) {
                return Badge(
                  label: Text('${cart.totalItems}'),
                  isLabelVisible: cart.totalItems > 0,
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CartPage()),
                      );
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final item = products[index];
          return ListTile(
            contentPadding: EdgeInsets.all(10),
            leading: ClipRRect(
              child: Image.network(
                item.gambar,
                fit: .cover,
                width: 50,
                height: 50,
              ),
            ),
            title: Text(item.nama),
            trailing: IconButton(
              onPressed: () {
                Provider.of<CartModel>(context, listen: false).add(item);
              },
              icon: Icon(Icons.add_shopping_cart),
            ),
          );
        },
      ),
    );
  }
}
