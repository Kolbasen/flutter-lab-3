import 'package:flutter/material.dart';
import 'package:flutter_lab3/models/cart.dart';
import 'package:flutter_lab3/models/list.dart';
import 'package:provider/provider.dart';
import 'package:flutter_lab3/screens/cart.dart';
import 'package:flutter_lab3/screens/shop.dart';
import 'package:flutter_lab3/themes/dark_theme.dart';
import 'package:flutter_lab3/themes/light_theme.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ThemeWrapper();
  }
}

class ThemeWrapper extends StatefulWidget {
  @override
  _ThemeWrapperState createState() => _ThemeWrapperState();
}

class _ThemeWrapperState extends State<ThemeWrapper> {
  ThemeData _currentTheme = lightTheme;

  void handleThemeSwitch() {
    ThemeData newTheme = _currentTheme == lightTheme ? darkTheme : lightTheme;
    setState(() {
      this._currentTheme = newTheme;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => ListModel()),
        ChangeNotifierProxyProvider<ListModel, CartModel>(
          create: (_) => CartModel(),
          update: (_, list, cart) {
            cart.list = list;
            return cart;
          },
        ),
      ],
      child: MaterialApp(
        title: 'Lab 3',
        theme: _currentTheme,
        initialRoute: '/',
        routes: {
          '/': (context) => ShopScreen(onThemeSwitch: handleThemeSwitch),
          '/cart': (context) => CartScreen(),
        },
      ),
    );
  }
}
