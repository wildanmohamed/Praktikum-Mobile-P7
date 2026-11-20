import 'package:flutter/material.dart';
import 'package:pertemuan7/cart_model.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Keranjang Anda'),
      ),

      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          if (cart.items.isEmpty) {
            return Center(child: Text('KERANJANG KOSONG'));
          }

          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              final item = cart.items[index];

              return ListTile(
                contentPadding: EdgeInsets.all(10),

                leading: ClipRRect(
                  child: Image.network(
                    item.gambar,
                    fit: BoxFit.cover,
                    width: 50,
                    height: 50,
                  ),
                ),

                title: Text(item.nama),

                // Tombol hapus
                trailing: IconButton(
                  onPressed: () {
                    Provider.of<CartModel>(context, listen: false).remove(item);

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${item.nama} berhasil dihapus'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  },
                  icon: Icon(Icons.delete),
                  color: Colors.red,
                ),
              );
            },
          );
        },
      ),
    );
  }
}
