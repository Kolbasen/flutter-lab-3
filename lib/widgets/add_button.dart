import 'package:flutter/material.dart';
import 'package:flutter_lab3/models/cart.dart';
import 'package:flutter_lab3/models/list.dart';
import 'package:provider/provider.dart';

class AddButton extends StatelessWidget {
  final ItemModel item;

  const AddButton({@required this.item, Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var isInCart = context.select<CartModel, bool>(
      (cart) => cart.items.contains(item),
    );

    return TextButton(
      onPressed: isInCart
          ? null
          : () {
              var cart = context.read<CartModel>();
              cart.add(item);
            },
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.resolveWith<Color>((states) {
          if (states.contains(MaterialState.pressed)) {
            return Theme.of(context).primaryColor;
          }
          return null;
        }),
      ),
      child: isInCart ? Icon(Icons.check, semanticLabel: 'ADDED') : Text('Add'),
    );
  }
}
