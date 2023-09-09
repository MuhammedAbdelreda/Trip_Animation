import 'package:flutter/material.dart';

class Heart extends StatefulWidget {
  @override
  _HeartState createState() => _HeartState();
}

class _HeartState extends State<Heart> with SingleTickerProviderStateMixin {
  bool isFav = false;
  AnimationController controller; //animation controller creation
  Animation<Color> colorTween;
  Animation<double> tweenSequence;
  Animation curve;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: Duration(milliseconds: 200),
      vsync: this, //animation ticker
    );

    curve = CurvedAnimation(parent: controller, curve: Curves.easeInExpo); //curvedAnimation creation
    
    colorTween = ColorTween(begin: Colors.grey[400], end: Colors.red[400]).animate(controller);
    //controller.forward();

    tweenSequence = TweenSequence(<TweenSequenceItem<double>>[ //animation for size using TweenSqunence(we have to create tweensequenceitem list)
      TweenSequenceItem(
        tween: Tween(begin: 30, end: 50),
        weight: 50,
      ),
      TweenSequenceItem(
        tween: Tween(begin: 50, end: 30),
        weight: 50,
      ),
    ]).animate(curve);


    controller.addListener(() {
      setState(() {
        controller.value; //animation value
        colorTween.value;
        tweenSequence.value;
      });
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        isFav = true;
      } else if (status == AnimationStatus.reverse) {
        isFav = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      //animatedBuilder requirments->animation,builder like tweeenAnimationBuilder
      animation: controller,
      builder: (context, _) {
        return IconButton(
          icon: Icon(
            Icons.favorite,
            color: colorTween.value,
            size: tweenSequence.value,
          ),
          onPressed: () {
            isFav ? controller.reverse() : controller.forward();
          },
        );
      },
    );
  }
}
