import 'package:flutter/material.dart';
import 'package:flutter_lab3/models/cart.dart';
import 'package:flutter_lab3/widgets/cart_app_bar.dart';
import 'package:flutter_lab3/widgets/cart_list.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var hugeStyle =
        Theme.of(context).textTheme.headline1.copyWith(fontSize: 48);

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: CartAppBar(),
      ),
      body: Container(
        color: Colors.yellow,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: CartList(),
              ),
            ),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: Consumer<CartModel>(
                        builder: (context, cart, child) =>
                            Text('\$${cart.totalPrice}', style: hugeStyle)),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
