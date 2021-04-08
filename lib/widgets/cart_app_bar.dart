import 'package:flutter/material.dart';

class CartAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Cart', style: Theme.of(context).textTheme.headline1),
    );
  }
}
