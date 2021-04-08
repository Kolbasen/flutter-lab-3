import 'package:flutter/material.dart';

class ListModel {
  static List<String> itemNames = [
    'The Nightmare',
    'The Fireball',
    'The Minotaur Maze',
    'The Giant Gnome',
    'The Awkward Zombie',
    'The Iron Gremlin',
    'The Majestic Marker',
    'The Haunting Mermaid',
    'The Bleeding Satyr',
  ];

  ItemModel getById(int id) => ItemModel(id, itemNames[id % itemNames.length]);

  ItemModel getByPosition(int position) => getById(position);
}

class ItemModel {
  final int id;
  final String name;
  final int price = 5;

  ItemModel(this.id, this.name);

  @override
  int get hashCode => id;

  @override
  bool operator ==(Object other) => other is ItemModel && other.id == id;
}
