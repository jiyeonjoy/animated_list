import 'package:flutter/material.dart';

/// 다 같은 build 를 갖는다고 가정 했을 때!
class Node<T> {

  final GlobalKey<AnimatedListState> _key = GlobalKey();
  final Function(T item, int index, Animation<double> animation) builder;
  final List<T> _items;

  GlobalKey<AnimatedListState> get getKey => _key;
  AnimatedListState get _animatedList => _key.currentState;

  Node(this.builder, this._items);

  void insert(int index, T item) {
    _items.insert(index, item);
    _animatedList.insertItem(index);
  }

  T removeAt(int index) {
    final T removeItem = _items.removeAt(index);
    if(removeItem != null) {
      _animatedList.removeItem(index, (BuildContext context, Animation<double> animation) {
        return builder(removeItem, index, animation);
      });
    }
    return removeItem;
  }

  int get length => _items.length;

  T operator [](int index) => _items[index];

  int indexOf(T item) => _items.indexOf(item);

  Widget buildAnimatedList({int initialItemCount}) {
    return AnimatedList(
      key: _key,
      initialItemCount: initialItemCount ?? length,
      itemBuilder: (context, index, animation) {
        return builder(_items[index], index, animation);
      },
    );
  }
}