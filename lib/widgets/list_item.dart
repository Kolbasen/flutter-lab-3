import 'package:flutter/material.dart';
import 'package:flutter_lab3/models/list.dart';
import 'package:flutter_lab3/widgets/add_button.dart';
import 'package:provider/provider.dart';

class ListItem extends StatelessWidget {
  final int index;

  ListItem(this.index, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var item = context.select<ListModel, ItemModel>(
      (list) => list.getByPosition(index),
    );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: LimitedBox(
        maxHeight: 48,
        child: Row(
          children: [
            AddButton(item: item),
            SizedBox(width: 24),
            Expanded(
              child: Text(item.name,
                  style: TextStyle(
                    color: Colors.primaries[item.id % Colors.primaries.length],
                    fontSize: 24,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
