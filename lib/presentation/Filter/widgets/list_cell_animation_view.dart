import 'package:flutter/material.dart';

class ListCellAnimationView extends StatelessWidget {
  final Animation<double> animation;
  final AnimationController animationController;
  final Widget child;
  final double yTranslation;

  const ListCellAnimationView({
    Key? key,
    required this.animation,
    required this.animationController,
    required this.child,
    this.yTranslation = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: child,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: animation,
          child: new Transform(
              transform: new Matrix4.translationValues(
                  0.0, yTranslation * (1.0 - animation.value), 0.0),
              child: child),
        );
      },
    );
  }
}