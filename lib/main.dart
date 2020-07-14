import 'package:flutter/material.dart';

import 'hookVersion.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  AnimationController controller;

  _MyHomePageState();

  @override
  void initState() {
    controller = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
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
                    builder: (context) => HookVersion(),
                  ));
            },
            child: Text(
              'Check Hook Version',
              style: TextStyle(color: Colors.red),
            ),
          ),
        ],
      ),
    );
  }
}