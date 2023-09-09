import 'package:flutter/material.dart';

class SandBox extends StatefulWidget {
  const SandBox({Key key}) : super(key: key);

  @override
  State<SandBox> createState() => _SandBoxState();
}

class _SandBoxState extends State<SandBox> {
  double _width = 250;
  bool clicked = false;
  Color color = Colors.blue;
  double _opacity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(  //animatedContainer
        duration: Duration(seconds: 1),
        width: _width,
        color: color,
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    if (clicked == false) {
                      _width = 100;
                      clicked = true;
                    } else if (clicked == true) {
                      _width = 250;
                      clicked = false;
                    }
                  });
                },
                child: Text('Change width')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    color = Colors.amber;
                  });
                },
                child: Text('Change color')),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    _opacity = 0;
                  });
                },
                child: Text('Change opacity')),
            AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: _opacity,
              child: Text('OpacityText'),
            ),
          ],
        ),
      ),
    );
  }
}
