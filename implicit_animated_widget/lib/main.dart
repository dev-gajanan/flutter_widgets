// ignore_for_file: prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  final List<Color> colors = [Colors.blue, Colors.red];
  final List<String> colorNames = ['Azure Sky', 'Icon Red'];
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Implicity Animated Widget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Center(
          child: GestureDetector(
            onTap: () {
              setState(() {
                index = index == 1 ? 0 : 1;
              });
            },
            child: ImplicitWidget(
              color: colors[index],
              colorName: colorNames[index],
            )
          )
        ),
      ),
    );
  }
}

class ImplicitWidget extends StatefulWidget {
  const ImplicitWidget(
      {Key? key, required this.color, required this.colorName});

  final Color color;
  final String colorName;

  @override
  State<ImplicitWidget> createState() => _ImplicitWidgetState();
}

class _ImplicitWidgetState extends State<ImplicitWidget> with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Color color;
  late String colorName;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2)
    );
    color = widget.color;
    colorName = widget.colorName;
  }

  @override
  void didUpdateWidget(ImplicitWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.colorName != widget.colorName || oldWidget.color != widget.color) {
      animateWidget();
    }

  }

  void animateWidget() {

    final startColor = color;
    final startColorName = colorName;
    final Animation<double> curve = CurvedAnimation(parent: controller, curve: Curves.easeOut);
    final tween  = Tween<double>(begin: 0, end: 1).animate(curve);

    tween.addListener(() {
      setState(() {
        print(tween.value);
        color = Color.lerp(startColor, widget.color, tween.value)!;
        if(tween.value < 0.5) {
          //Deleting the current name
          
        } else {

        }

      });

    });

    controller
      ..reset()
      ..forward();

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      height: 200,
      width: 200,
      child: Center(child: Text(colorName)),
    );
  }
}
