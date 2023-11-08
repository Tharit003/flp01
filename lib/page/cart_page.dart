import 'package:flutter/material.dart';
import 'package:flutter_pj/component/mybutton.dart';
import 'package:flutter_pj/model/product.dart';
import 'package:flutter_pj/model/shop.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context, 
      builder: (context) => AlertDialog(
        content: const Text("Remove this item to your cart"),
        actions: [
          MaterialButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancle"),
          ),

          MaterialButton(
            onPressed: () {
              Navigator.pop(context);

              context.read<Shop>().removeFromCart(product);
            },
            child: const Text("Yes"),
          ),
        ],
      ),
    );
  }

  void payButtonPressend(BuildContext context) {
    showDialog(
      context: context, 
      builder: (context) => const AlertDialog(
        content: 
          Text("User want to pay!"),
      )
      );
  }



  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("CartPage page"),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty
            ?Center(child: Text("You cart is empty.."))
            :ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final item = cart[index];

                return ListTile(
                  title: Text(item.name),
                  subtitle: Text(item.price.toStringAsFixed(2)),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove),
                    onPressed: () => removeItemFromCart(context, item),
                  ),
                );
              },
            ),
          ),

          MyButton(
            onTap: () => payButtonPressend(context), 
            hinText: 'PAYNOW',)
            
        ],
      ),
    );
  }
}
