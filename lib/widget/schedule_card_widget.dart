import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScheduleCardWidget extends StatefulWidget {
  final String time;
  final String subject;
  final String teacher;
  final String duration;
  final void Function()? onTap;

  const ScheduleCardWidget({
    super.key,
    required this.time,
    required this.subject,
    required this.teacher,
    required this.duration,
    required this.onTap,
  });

  @override
  State<ScheduleCardWidget> createState() => _ScheduleCardWidgetState();
}

class _ScheduleCardWidgetState extends State<ScheduleCardWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final Duration _animationDuration = const Duration(milliseconds: 300);
  final Tween<double> _tween = Tween<double>(begin: 1.0, end: 0.95);

  @override
  void initState() {
    _controller = AnimationController(vsync: this, duration: _animationDuration)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          await _controller.forward().then((_) {
            _controller.reverse();
          });
          widget.onTap!();
        },
        child: ScaleTransition(
          scale: _tween.animate(
            CurvedAnimation(
              parent: _controller,
              curve: Curves.easeOut,
              reverseCurve: Curves.easeIn,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: EdgeInsets.only(bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(26),
              border: Border.all(
                color: Color.fromARGB(255, 3, 42, 74).withValues(alpha: 0.2),
                width: 2,
              ),
            ),
            child: Row(
              spacing: 20,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.time,
                  style: GoogleFonts.poppins(
                    color: Color.fromARGB(
                      255,
                      3,
                      42,
                      74,
                    ).withValues(alpha: 0.6),
                  ),
                ),
                Container(
                  color: Color.fromARGB(255, 3, 42, 74).withValues(alpha: 0.2),
                  width: 1,
                  height: 58,
                ),
                Expanded(
                  child: Column(
                    spacing: 6,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.subject,
                        style: TextStyle(
                          color: Color.fromARGB(255, 7, 75, 127),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.teacher,
                        style: TextStyle(
                          color: Color.fromARGB(255, 8, 62, 107),
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
                _progressIndicator(widget.duration),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _progressIndicator(String text) {
    List durationValue = [0.6];
    return Column(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            CircularProgressIndicator(
              value: durationValue[0],
              backgroundColor: Color.fromARGB(
                255,
                171,
                227,
                242,
              ).withValues(alpha: 0.2),
              color: Color.fromARGB(255, 7, 66, 155),
              constraints: BoxConstraints(minHeight: 68, minWidth: 68),
              strokeWidth: 8,
              strokeCap: StrokeCap.round,
            ),
            Text(text, style: const TextStyle(color: Colors.black)),
          ],
        ),
      ],
    );
  }
}
