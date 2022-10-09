import 'package:flutter/material.dart';

class LikeAnimation extends StatefulWidget {
  final Duration duration;
  final Widget child;
  final bool isAnimating;
  final bool smallLike;
  final VoidCallback onEnd;

  const LikeAnimation({
    Key? key,
    this.duration = const Duration(milliseconds: 150),
    required this.child,
    required this.isAnimating,
    required this.smallLike,
    required this.onEnd,


  }) : super(key: key);

  @override
  State<LikeAnimation> createState() => _LikeAnimationState();
}

class _LikeAnimationState extends State<LikeAnimation> with TickerProviderStateMixin{
  late AnimationController _controller;
  late Animation<double> _scale;
  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: Duration(milliseconds: widget.duration.inMilliseconds ~/ 2 ));
    _scale = Tween<double>(begin: 1, end: 1.9).animate(_controller);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant LikeAnimation oldWidget) {
    super.didUpdateWidget(oldWidget);

    if(widget.isAnimating != oldWidget.isAnimating){

        startAnimation();

    }
  }

  startAnimation()async{
    if(widget.isAnimating || widget.smallLike){
      await _controller.forward();
      await _controller.reverse();
      await Future.delayed(Duration(milliseconds: 200));

      if(widget.onEnd != null){
        widget.onEnd();
      }
    }

  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scale,
      child: widget.child,
    );
  }
}
