part of 'package:ovida/src/features/home/presentation/screens/home_screen.dart';

class _UpcomingDoseContainer extends StatelessWidget {
  final Dose? upcomingDose;
  const _UpcomingDoseContainer({
    required this.upcomingDose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.r),
      decoration: BoxDecoration(
        color: AppColors.sectionsBackground,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Upcoming Dose!',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text('Your next dose of Hemoclar at 03:00pm',
              style: Theme.of(context).textTheme.bodySmall),
          SizedBox(height: 16.h),
          Row(
            children: [
              Column(
                children: [
                  Row(
                    children: [
                      BorderedButtonWithIcon(
                        height: 36.h,
                        width: 74.w,
                        text: "Take",
                        iconPath: AppIcons.take,
                        onPressed: () {},
                      ),
                      SizedBox(width: 8.w),
                      BorderedButtonWithIcon(
                        height: 36.h,
                        width: 74.w,
                        text: "Skip",
                        iconPath: AppIcons.skip,
                        onPressed: () {},
                      ),
                    ],
                  ),
                  SizedBox(height: 8.h),
                  BorderedButtonWithIcon(
                    height: 36.h,
                    width: 154.w,
                    text: "Snooze for 10 mins",
                    iconPath: AppIcons.snooze,
                    onPressed: () {},
                  ),
                ],
              ),
              Spacer(),
              GradientTimerWidget(
                totalTimeInMinutes: 15,
                gradientColors: const [
                  Color(0xFFB8A6FF),
                  Color(0xFF8B7CFF)
                ], // Purple gradient
                strokeWidth: 8.0,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class GradientTimerWidget extends StatefulWidget {
  final int totalTimeInMinutes;
  final List<Color> gradientColors;
  final double strokeWidth;
  final TextStyle timeTextStyle;
  final TextStyle labelTextStyle;

  const GradientTimerWidget({
    Key? key,
    required this.totalTimeInMinutes,
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
  double _progress = 0.5;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          width: 120,
          height: 120,
          child: CustomPaint(
            painter: GradientCircularProgressPainter(
              progress: 0.75,
              strokeWidth: widget.strokeWidth,
              gradientColors: widget.gradientColors,
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "15",
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

class GradientCircularProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final List<Color> gradientColors;

  GradientCircularProgressPainter({
    required this.progress,
    required this.strokeWidth,
    required this.gradientColors,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = (size.width - strokeWidth) / 2;

    // Background circle (optional - light gray background)
    final backgroundPaint = Paint()
      ..color = Colors.grey.shade100
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    canvas.drawCircle(center, radius, backgroundPaint);

    // Progress arc with gradient
    final rect = Rect.fromCircle(center: center, radius: radius);
    final gradient = SweepGradient(
      colors: gradientColors,
      startAngle: 3 * 3.14 / 2, // Start from top (270 degrees)
      endAngle: 7 * 3.14 / 2, // Full circle (270 + 360 degrees)
      tileMode: TileMode.repeated,
    );

    final progressPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    final startAngle = -3.14 / 2; // Start from top (270 degrees in radians)
    final sweepAngle = 2 * 3.14 * progress; // Full circle is 2*PI radians

    canvas.drawArc(
      rect,
      startAngle,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant GradientCircularProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.gradientColors != gradientColors;
  }
}
