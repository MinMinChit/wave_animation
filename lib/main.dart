import 'package:flutter/material.dart';
import 'package:wave_animation/wave_animation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late Animation<double> animation1;
  late AnimationController _controller1;

  late Animation<double> animation2;
  late AnimationController _controller2;

  late Animation<double> animation3;
  late AnimationController _controller3;

  @override
  void initState() {
    _controller1 =
        AnimationController(duration: const Duration(seconds: 20), vsync: this);
    _controller1.repeat();

    animation1 = Tween<double>(begin: -5000, end: 0).animate(_controller1);

    animation1.addListener(() {
      setState(() {});
    });

    _controller2 =
        AnimationController(duration: const Duration(seconds: 10), vsync: this);
    _controller2.repeat();

    animation2 = Tween<double>(begin: 0, end: -5000).animate(_controller2);
    animation2.addListener(() {
      setState(() {});
    });

    _controller3 =
        AnimationController(duration: const Duration(seconds: 20), vsync: this);
    _controller3.repeat();

    animation3 = Tween<double>(begin: -5000, end: 0).animate(_controller3);
    animation3.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller1.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Wave'),
      ),
      body: Stack(
        children: [
          Positioned(
            left: animation1.value,
            child: CustomPaint(
              painter: WaveAnimation(
                waveHeight: 200,
                color: Colors.green,
                waveLength: 800,
              ),
            ),
          ),
          Positioned(
            left: animation2.value,
            child: CustomPaint(
              painter: WaveAnimation(
                waveHeight: 220,
                color: Colors.blue,
                waveLength: 880,
                reverse: true,
              ),
            ),
          ),
          Positioned(
            left: animation3.value,
            top: 80,
            child: CustomPaint(
              painter: WaveAnimation(
                waveHeight: 80,
                color: Colors.amber,
                waveLength: MediaQuery.sizeOf(context).width / 2,
                reverse: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
