import 'package:animated_list/first/sample1.dart';
import 'package:animated_list/first/sample2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(
      MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MainWidget()
      )
  );
}

class MainWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedList Sample'),
      ),
      body: Center(
        child: Column(
          children: [
            Spacer(flex: 1,),
            InkWell(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Text(
                  'Sample 1',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () async {
                final result = await Navigator.push(
                    context, MaterialPageRoute(builder: (context) => AnimatedListSample1())
                );
              },
            ),
            InkWell(
              borderRadius: BorderRadius.circular(30),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                child: Text(
                  'Sample 2',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () async {
                final result = await Navigator.push(
                    context, MaterialPageRoute(builder: (context) => AnimatedListSample2())
                );
              },
            ),
            Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }
}
