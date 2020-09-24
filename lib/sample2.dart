import 'package:flutter/material.dart';

class AnimatedListSample2 extends StatefulWidget {
  @override
  _AnimatedListSample2State createState() => _AnimatedListSample2State();
}

class _AnimatedListSample2State extends State<AnimatedListSample2> {

  // 일단 공통적으로 GlobalKey 필요
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  List<String> _items = [
    'item 1',
    'item 2',
    'item 3'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample 2'),
      ),
      body: AnimatedList(
        key: _key,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(_items[index],animation,index);
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addItem(),
      ),
    );
  }

  Widget _buildItem(String item, Animation animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        elevation: 2,
        child: ListTile(
          title: Text(
            item,
            style: TextStyle(
              fontWeight: FontWeight.w600
            ),
          ),
          subtitle: Text('lorem ipsum dolor...'),
          leading: CircleAvatar(backgroundColor: Colors.amber,),
          trailing: IconButton(
            icon: Icon(Icons.close,color: Colors.redAccent,),
            onPressed: () {
              _removeItem(index);
            },
          ),
        ),
      ),
    );
  }

  void _removeItem(int index) {
    String removeItem = _items.removeAt(index);
    AnimatedListRemovedItemBuilder builder = (context,animation) {
      return _buildItem(removeItem,animation,index);
    };
    _key.currentState.removeItem(index, builder);
  }

  void _addItem() {
    int i = _items.length > 0 ? _items.length : 0;
    _items.insert(i, 'Item ${_items.length + 1}');
    _key.currentState.insertItem(i);
  }
}
