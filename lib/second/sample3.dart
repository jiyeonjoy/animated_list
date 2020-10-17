import 'package:animated_list/simple_list/simple_list_1.dart';
import 'package:flutter/material.dart';

class AnimatedListSample3 extends StatefulWidget {
  @override
  _AnimatedListSample3State createState() => _AnimatedListSample3State();
}

class _AnimatedListSample3State extends State<AnimatedListSample3> {

  Node<String> node;
  int i;

  @override
  void initState() {
    super.initState();
    node = Node<String>(
      builder,
      ['# 1', '# 2', '# 3']
    );
    i = 4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sample 3'),
      ),
      body: node.buildAnimatedList(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => node.insert(node.length, '# ${i++}'),
      ),
    );
  }

  Widget builder(String item, int index, Animation<double> animation) {
    return SizeTransition(
      sizeFactor: animation,
      child: Card(
        elevation: 2,
        child: ListTile(
          title: Text(
            item,
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),
          subtitle: Text('...............'),
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
}