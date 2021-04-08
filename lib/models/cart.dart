import 'package:flutter/foundation.dart';
import 'package:flutter_lab3/models/list.dart';

class CartModel extends ChangeNotifier {
  ListModel _list;

  final List<int> _itemIds = [];

  set list(ListModel newList) {
    _list = newList;
    notifyListeners();
  }

  List<ItemModel> get items => _itemIds.map((id) => _list.getById(id)).toList();

  int get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  void add(ItemModel item) {
    _itemIds.add(item.id);
    notifyListeners();
  }

  void remove(ItemModel item) {
    _itemIds.remove(item.id);
    notifyListeners();
  }
}
