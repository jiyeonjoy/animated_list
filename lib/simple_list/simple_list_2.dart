import 'package:flutter/material.dart';

/// item 마다 다른 build 를 갖는다고 가정 했을 때!!
class Item {
  final Function(int index, Animation<double> animation) builder;

  Item(this.builder);
}

class Node {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  final List<Item> _items;

  GlobalKey<AnimatedListState> get getKey => _key;
  AnimatedListState get _animatedList => _key.currentState;

  Node(this._items);

  void insert(int index, Item item) {
    _items.insert(index, item);
    _animatedList.insertItem(index);
  }

  Item removeAt(int index) {
    final Item removeItem = _items.removeAt(index);
    if(removeItem != null) {
      _animatedList.removeItem(index, (BuildContext context, Animation<double> animation) {
        return removeItem.builder(index, animation);
      });
    }
    return removeItem;
  }

  int get length => _items.length;

  Item operator [](int index) => _items[index];

  int indexOf(Item item) => _items.indexOf(item);

  Widget buildAnimatedList({int initialItemCount}) {
    return AnimatedList(
      key: _key,
      initialItemCount: initialItemCount ?? length,
      itemBuilder: (context, index, animation) {
        return _items[index].builder(index, animation);
      },
    );
  }
}