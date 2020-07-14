import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooksagainststatefulwidget/main.dart';

void main() => runApp(new HookVersion());

class HookVersion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(duration: Duration(milliseconds: 800));
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RotationTransition(
            turns: controller,
            child: ColoredBox(
              color: Colors.red,
              child: SizedBox(
                width: 200,
                height: 200,
              ),
            ),
          ),
          FlatButton(
            onPressed: () {
              if (controller.isCompleted) {
                controller.reset();
              }
              controller.animateTo(controller.value + .25);
            },
            child: Text(
              'Rotate',
              style: TextStyle(color: Colors.red),
            ),
          ),
          FlatButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ));
            },
            child: Text(
              'Check Stateful Version',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}