import 'package:flutter/material.dart';

class AnimatedListSample2 extends StatefulWidget {
  @override
  _AnimatedListSample2State createState() => _AnimatedListSample2State();
}

class _AnimatedListSample2State extends State<AnimatedListSample2> {

  /// GlobalKey<AnimatedListState>
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
      /// itemBuilder 파라미터에는 animation 있음!!
      body: AnimatedList(
        key: _key,
        initialItemCount: _items.length,
        itemBuilder: (context, index, animation) {
          return _buildItem(_items[index],animation,index);
        },
      ),
      /// 추가하는 버튼
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _addItem(),
      ),
    );
  }

  /// SizeTransition 으로 감싸고 해당 animation을 sizeFactor에 넣어줘야됨!
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
          /// 해당 아이템을 지우는 버튼
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
    /// AnimatedListRemoveItemBuilder 에서 지우는 animation 을 아이템을 그려주는 메소드에 넣어준다.
    AnimatedListRemovedItemBuilder builder = (context,animation) {
      return _buildItem(removeItem,animation,index);
    };
    /// _key를 할당한 AnimatedList 에서
    /// 첫번째 파라미터인 index 순서에 두번째 파라미터 builder 에 해당하는 아이템을 지운다.
    _key.currentState.removeItem(index, builder);
  }

  void _addItem() {
    int i = _items.length > 0 ? _items.length : 0;
    _items.insert(i, 'Item ${_items.length + 1}');
    /// _key를 할당한 AnimatedList 에서 i번째에 해당하는 순서에 아이템을 추가 한다.
    _key.currentState.insertItem(i);
  }
}
