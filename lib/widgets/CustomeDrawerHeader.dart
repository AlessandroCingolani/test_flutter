import 'package:flutter/material.dart';

class CustomeDrawerHeader extends StatelessWidget implements PreferredSizeWidget {


  @override
  Widget build(BuildContext context) {
    return
    Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
             DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
               child: const Center(
                 child: CircleAvatar(
                   backgroundColor: Colors.transparent, // Sfondo trasparente
                   backgroundImage: NetworkImage('https://w.wallhaven.cc/full/4l/wallhaven-4l1vpl.png'), // URL dell'immagine
                   radius: 100.0, // Dimensione del cerchio
                 ),
               ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                Navigator.pushNamed(context, '/home', arguments: 'Home Page');
              },
            ),
            ListTile(
              title: const Text('Lista personaggi'),
              onTap: () {
                Navigator.pushNamed(context, '/lista-personaggi');
              },
            ),
            ListTile(
              title: const Text('Lista episodi'),
              onTap: () {
                Navigator.pushNamed(context, '/lista-episodi');
              },
            ),
          ],
        ),
      );

  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}


