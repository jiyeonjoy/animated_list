import 'package:flutter/material.dart';

class AnimatedListSample3 extends StatefulWidget {
  @override
  _AnimatedListSample3State createState() => _AnimatedListSample3State();
}

class _AnimatedListSample3State extends State<AnimatedListSample3> {

  // List<String> _items = [
  //   'item 1',
  //   'item 2',
  //   'item 3'
  // ];
  // List<Item<T>> = [
  //   Item(1, )
  // ]
  // Node node = Node(list: _items);

  @override
  void initState() {
//    node = Node()
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


class Item<T> {
  final int index;
  final Widget Function(Animation animation, int index) builder;
  final T t;
  //final AnimatedListItemBuilder builder;

  /// final const ???
  Item({this.index, this.builder, this.t});

  Widget itemBuilder(BuildContext context, int index, Animation<double> animation) {
    return builder(animation, index);
  }
}

class Node<T> {
  // GlobalKey<AnimatedListState>
  // node 당 한개의 글로벌 키를 갖도록 설정 필요!!
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  final dynamic removedItemBuilder;
  List<Item<T>> _list;

  Node({
    @required this.removedItemBuilder,
    Iterable<T> initialItems,
  }) : assert(removedItemBuilder != null) {
    if(initialItems != null) {
      _list = <Item<T>>[];
      int i = 0;
      for(var item in initialItems) {
        _list.add(Item(index: i++, builder: removedItemBuilder, t: item));
      }
    } else {
      _list = <Item<T>>[];
    }
  }
  /// 구현 가능 할 수 있도록
  /// 여러아이템 한번에 삭제 가능한지 확인 필요!! for문 말고. 만들 수 있을듯 상속해서 코드까봐

  // static List<Item<T>> getList(Iterable<T> initialItems) {
  //
  // }

  // index는 아이템이 갖고있기때문에 찾고 지울수있도록 최대한 쉽게 구현하도록
  void add(Item item) {
    int i = _list.length > 0 ? _list.length : 0;
    _list.insert(i, item);
    _key.currentState.insertItem(i);
  }

  void remove(int index) {
    Item removeItem = _list.removeAt(index);
    AnimatedListRemovedItemBuilder builder = (context, animation) {
      return removeItem.itemBuilder(context, index, animation);
    };
    _key.currentState.removeItem(index, builder);
  }
}

/// Key는 밑에있는 Node의 키를 가져와서 만약 노드가 천개면 어떻게 찾을지 for문 말고 search 알고리즘 등 찾기!!
// Node가 트리처럼 갈수있도록 노트와 노드스의 기능을 인터페이스로 구현한다던가 기능을 따로 뺄수있는 여부 확인필요!!
class Nodes<T> {
  List<Node<T>> _list;
}