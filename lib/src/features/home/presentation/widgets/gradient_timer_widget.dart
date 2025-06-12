import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ovida/src/features/home/presentation/widgets/gradient_circular_progress_painter.dart';

class GradientTimerWidget extends StatefulWidget {
  final int remainingMinutes;
  final int totalMinutes;
  final List<Color> gradientColors;

  const GradientTimerWidget({
    Key? key,
    required this.remainingMinutes,
    required this.totalMinutes,
    this.gradientColors = const [Color(0xFFB8A6FF), Color(0xFF8B7CFF)],
  }) : super(key: key);

  @override
  State<GradientTimerWidget> createState() => _GradientTimerWidgetState();
}

class _GradientTimerWidgetState extends State<GradientTimerWidget> {
  @override
  Widget build(BuildContext context) {
    final progress = widget.remainingMinutes > widget.totalMinutes
        ? 0.001
        : (widget.totalMinutes - widget.remainingMinutes) / widget.totalMinutes;
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 120.sp,
          height: 120.sp,
          child: CustomPaint(
            painter: GradientCircularProgressPainter(
              progress: progress,
              gradientColors: widget.gradientColors,
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              (widget.remainingMinutes > widget.totalMinutes
                      ? widget.totalMinutes
                      : widget.remainingMinutes)
                  .toString(),
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2D3142),
              ),
            ),
            Text('mins',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF2D3142),
                )),
          ],
        ),
      ],
    );
  }
}
