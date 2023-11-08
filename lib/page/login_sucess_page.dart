import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_pj/component/drawer.dart';
import 'package:flutter_pj/component/my_product_tile.dart';
import 'package:flutter_pj/main.dart';
import 'package:flutter_pj/model/shop.dart';
import 'package:flutter_pj/page/cart_page.dart';
import 'package:flutter_pj/screen/add_note_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final user = FirebaseAuth.instance.currentUser;

  bool show = true;

  void signOutUser() async {
    await FirebaseAuth.instance.signOut();
    const MyApp();
  }

  void goToCartPage() {
    Navigator.pop(context);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CartPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final products = context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 238, 216, 216),
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Shop Page"),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'), 
            icon: const Icon(Icons.shopping_bag_outlined)),
        ],
      ),
      drawer: MyDrawer(
        onSignOut: signOutUser,
        onCartTap: goToCartPage,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(height: 25),
          Center(
            child: Text(
              "Pick from a select list of premium product",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
          ),
          SizedBox(
            height: 550,
            child: ListView.builder(
              itemCount: products.length,
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.all(15),
              itemBuilder: (context, index) {
                final product = products[index];

                return MyProductTile(product: product);
              },
            ),
          ),
        ],
      ),
    );
  }
}
