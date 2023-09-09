import 'package:flutter/material.dart';

class ScreenTitle extends StatelessWidget {
  final String text;

  const ScreenTitle({Key key, this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder( //tweenAnimationBuilder requirments: tweeen,duration,builder and return
      child: Text(
        text,
        style: TextStyle(fontSize: 36, color: Colors.white, fontWeight: FontWeight.bold),
      ),
      tween: Tween<double>(begin: 0,end: 1),
      duration: Duration(seconds: 1),
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
    );
  }
}
