import 'package:flutter/material.dart';

class LoadingIndicator extends StatefulWidget {
  const LoadingIndicator({Key? key}) : super(key: key);

  @override
  _LoadingIndicatorState createState() => _LoadingIndicatorState();
}

class _LoadingIndicatorState extends State<LoadingIndicator>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  late Animation<double> _animation1;
  late Animation<double> _animation2;
  late Animation<double> _animation3;

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..repeat();
    _animation1 = Tween<double>(begin: 0.0, end: 1.0).animate(_controller1);

    _controller2 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..repeat();
    _animation2 = Tween<double>(begin: 0.0, end: 1.0).animate(_controller2);

    _controller3 = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 500),
    )..repeat();
    _animation3 = Tween<double>(begin: 0.0, end: 1.0).animate(_controller3);

    // Introduce a delay for the second and third circle
    Future.delayed(Duration(milliseconds: 250), () {
      _controller2.forward();
    });

    Future.delayed(Duration(milliseconds: 500), () {
      _controller3.forward();
    });
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildBlinkingCircle(_animation1),
        SizedBox(width: 16),
        _buildBlinkingCircle(_animation2),
        SizedBox(width: 16),
        _buildBlinkingCircle(_animation3),
      ],
    );
  }

  Widget _buildBlinkingCircle(Animation<double> animation) {
    return FadeTransition(
      opacity: animation,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: Color(0xFF38C0CE),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
