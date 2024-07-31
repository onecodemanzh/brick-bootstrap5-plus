
import 'package:flutter/material.dart';

class Rotation extends StatefulWidget {
  final Widget child;
  bool expanded;
  Rotation({
    super.key,
    required this.child,
    required this.expanded,
  });
  @override
  RotationState createState() => RotationState();
}

class RotationState extends State<Rotation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
      upperBound: 0.5,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    if (widget.expanded) {
      controller.forward(from: 0.0);
    } else {
      controller.reverse(from: 0.5);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      print('object');
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: animation,
      child: widget.child,
    );
  }
}
