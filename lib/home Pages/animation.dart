import 'package:flutter/material.dart';

class ListeningAnimation extends StatefulWidget {
  const ListeningAnimation({super.key});

  @override
  State<ListeningAnimation> createState() => _ListeningAnimationState();
}

class _ListeningAnimationState extends State<ListeningAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              // 3 pulsing waves
              for (int i = 1; i <= 3; i++) _buildWave(i, _controller.value),
              // Mic circle in center
              Container(
                width: 80,
                height: 80,
                decoration: const BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.volume_up,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildWave(int wave, double value) {
    final double size = 80 + (value * wave * 40); // wave expansion
    final double opacity = (1 - value).clamp(0.0, 1.0);

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue.withOpacity(opacity / wave),
      ),
    );
  }
}
