import 'package:flutter/material.dart';
import 'package:flutter_pj/component/mylisttile.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onSignOut;
  final void Function()? onCartTap;

  const MyDrawer({super.key, this.onSignOut, this.onCartTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color.fromARGB(255, 252, 199, 232),
      child: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DrawerHeader(
                child: Center(
                  child: Icon(
                    Icons.shopping_bag,
                    size: 72,
                    color: Colors.grey[600],
                  ),
                ),
              ),

              const SizedBox(height: 25),

              MyListTile(
                text: 'S H O P', 
                icon: Icons.home, 
                onTap: () => Navigator.pop(context)
              ),

              MyListTile(
                text: 'C A R T', 
                icon: Icons.shopping_cart, 
                onTap: onCartTap
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: MyListTile(
              text: 'E X I T', 
              icon: Icons.logout, 
              onTap: onSignOut
            ),
          ),
        ],
      ),
    );
  }
}
