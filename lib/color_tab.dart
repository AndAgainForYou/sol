import 'dart:math';
import 'package:flutter/material.dart';

class ColorTapHomePage extends StatefulWidget {
  const ColorTapHomePage({super.key});

  @override
  State<ColorTapHomePage> createState() => _ColorTapHomePageState();
}

class _ColorTapHomePageState extends State<ColorTapHomePage> {
  static final Random _random = Random();

  Color _backgroundColor = Colors.white;


  Color get _labelColor =>
      ThemeData.estimateBrightnessForColor(_backgroundColor) == Brightness.light
          ? Colors.black87
          : Colors.white;

  void _onTap() {
    setState(() {
      final r = _random.nextInt(256);
      final g = _random.nextInt(256);
      final b = _random.nextInt(256);
      _backgroundColor = Color.fromRGBO(r, g, b, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: ColoredBox(
        color: _backgroundColor,
        child: Center(
          child: Text(
            'Hello There!!!',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w300,
              color: _labelColor,
            ),
          ),
        ),
      ),
    );
  }
}
