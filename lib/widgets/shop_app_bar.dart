import 'package:flutter/material.dart';

class ShopAppBar extends StatelessWidget {
  final Function onThemeSwitch;
  ShopAppBar({@required this.onThemeSwitch});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Text('Item list', style: Theme.of(context).textTheme.headline1),
      floating: true,
      actions: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () => Navigator.pushNamed(context, '/cart'),
        ),
        IconButton(
          icon: Icon(Icons.accessible_forward_sharp),
          onPressed: onThemeSwitch,
        ),
      ],
    );
  }
}
