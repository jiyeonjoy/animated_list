import 'package:flutter/material.dart';

class GestureDetectorTest extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gesture Detector Test')
      ),
      body: Center(
        child: GestureDetector(
//          behavior: HitTestBehavior.deferToChild, // second
//          behavior: HitTestBehavior.opaque, // second
//          behavior: HitTestBehavior.translucent, // second
          onTap: () {
            print('----------------------first GD on tap');
          },
          child: Container(
            width: 200,
            height: 200,
            color: Colors.amber,
            child: GestureDetector(
//              behavior: HitTestBehavior.deferToChild, // first
//              behavior: HitTestBehavior.opaque, // second
//              behavior: HitTestBehavior.translucent, // second
              onTap: () {
                print('----------------------second GD on tap');
              },
            ),
          ),
        ),
      ),
    );
  }
}