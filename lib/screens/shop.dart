import 'package:flutter/material.dart';
import 'package:flutter_lab3/widgets/list_item.dart';
import 'package:flutter_lab3/widgets/shop_app_bar.dart';

class ShopScreen extends StatelessWidget {
  final Function onThemeSwitch;

  ShopScreen({
    @required this.onThemeSwitch,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          ShopAppBar(
            onThemeSwitch: onThemeSwitch,
          ),
          SliverToBoxAdapter(child: SizedBox(height: 12)),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                    (context, index) => ListItem(index)),
          ),
        ],
      ),
    );
  }
}