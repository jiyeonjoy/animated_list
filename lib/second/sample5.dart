import 'package:animated_list/simple_list/simple_list_2.dart';
import 'package:flutter/material.dart';

class AnimatedListSample5 extends StatefulWidget {
  @override
  _AnimatedListSample5State createState() => _AnimatedListSample5State();
}

class _AnimatedListSample5State extends State<AnimatedListSample5> {

  Node node;
  int i;

  @override
  void initState() {
    super.initState();
    List<Item> items = [];
    items.add(Item(builder1));
    items.add(Item(builder2));
    items.add(Item(builder1));
    items.add(Item(builder2));
    node = Node(items);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample 5'),
      ),
      body: node.buildAnimatedList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => node.insert(
          node.length,
          node.length.isEven ? Item(builder1) : Item(builder2)
        ),
      ),
    );
  }

  Widget builder1(int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        elevation: 2,
        child: ListTile(
          title: Text(
            'builder 1',
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),
          subtitle: Text('11111111111'),
          leading: CircleAvatar(backgroundColor: Colors.amber,),
          trailing: IconButton(
            icon: Icon(Icons.close, color: Colors.red,),
            onPressed: () {
              node.removeAt(index);
            },
          ),
        ),
      ),
    );
  }

  Widget builder2(int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        elevation: 2,
        child: ListTile(
          title: Container(
            height: 150,
            child: Text(
              'builder 2',
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          subtitle: Text('2222222222222'),
          leading: CircleAvatar(backgroundColor: Colors.blue,),
          trailing: IconButton(
            icon: Icon(Icons.subject, color: Colors.red,),
            onPressed: () {
              node.removeAt(index);
            },
          ),
        ),
      ),
    );
  }
}