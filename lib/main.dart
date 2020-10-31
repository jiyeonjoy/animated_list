import 'package:animated_list/first/sample1.dart';
import 'package:animated_list/first/sample2.dart';
import 'package:animated_list/second/sample3.dart';
import 'package:animated_list/second/sample4.dart';
import 'package:animated_list/second/sample5.dart';
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
            _buildButton(context, 'Sample 1',
                    () => Navigator.push(
                        context, MaterialPageRoute(builder: (context) => AnimatedListSample1()))),
            _buildButton(context, 'Sample 2',
                    () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => AnimatedListSample2()))),
            _buildButton(context, 'Sample 3',
                    () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => AnimatedListSample3()))),
            _buildButton(context, 'Sample 4',
                    () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => AnimatedListSample4()))),
            _buildButton(context, 'Sample 5',
                    () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => AnimatedListSample5()))),
//            _buildButton(context, 'GestureDetector Test',
//                    () => Navigator.push(
//                    context, MaterialPageRoute(builder: (context) => GestureDetectorTest()))),
            Spacer(flex: 2,),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title, Function onTap) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      onTap: onTap
    );
  }
}
