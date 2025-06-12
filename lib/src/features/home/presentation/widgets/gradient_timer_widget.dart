import 'package:flutter/material.dart';
import 'package:ovida/src/features/home/presentation/widgets/gradient_circular_progress_painter.dart';

class GradientTimerWidget extends StatefulWidget {
  final int remainingMinutes;
  final int totalMinutes;
  final List<Color> gradientColors;
  final double strokeWidth;
  final TextStyle timeTextStyle;
  final TextStyle labelTextStyle;

  const GradientTimerWidget({
    Key? key,
    required this.remainingMinutes,
    required this.totalMinutes,
    this.gradientColors = const [Color(0xFFB8A6FF), Color(0xFF8B7CFF)],
    this.strokeWidth = 8.0,
    this.timeTextStyle = const TextStyle(
      fontSize: 36,
      fontWeight: FontWeight.bold,
      color: Color(0xFF2D3142),
    ),
    this.labelTextStyle = const TextStyle(
      fontSize: 14,
      color: Color(0xFF2D3142),
    ),
  }) : super(key: key);

  @override
  State<GradientTimerWidget> createState() => _GradientTimerWidgetState();
}

class _GradientTimerWidgetState extends State<GradientTimerWidget> {
  @override
  Widget build(BuildContext context) {
    final totalTimeInMinutes = widget.totalMinutes - widget.remainingMinutes;
    final progress = totalTimeInMinutes / widget.totalMinutes;
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: CustomPaint(
            painter: GradientCircularProgressPainter(
              progress: progress,
              strokeWidth: widget.strokeWidth,
              gradientColors: widget.gradientColors,
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.remainingMinutes.toString(),
              style: widget.timeTextStyle,
            ),
            Text(
              'mins',
              style: widget.labelTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
