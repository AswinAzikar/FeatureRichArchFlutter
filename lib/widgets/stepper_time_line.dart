import 'package:flutter/material.dart';

class StepperTimeline extends StatelessWidget {
  final List<String> steps;
  final int currentStep;
  final Color activeColor;
  final Color inactiveColor;
  final double circleSize;
  final double lineWidth;

  const StepperTimeline({
    super.key,
    required this.steps,
    required this.currentStep,
    this.activeColor = Colors.green,
    this.inactiveColor = Colors.grey,
    this.circleSize = 20.0,
    this.lineWidth = 3.0,
  }) : assert(currentStep >= 0);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(steps.length, (index) {
        final isActive = index <= currentStep;
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                _buildCircle(isActive),
                if (index != steps.length - 1)
                  _buildLine(isActive || index + 1 <= currentStep),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  steps[index],
                  style: TextStyle(
                    fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                    color: isActive ? activeColor : inactiveColor,
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  Widget _buildCircle(bool isActive) {
    return Container(
      width: circleSize,
      height: circleSize,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? activeColor : inactiveColor.withOpacity(0.3),
        border: Border.all(
          color: isActive ? activeColor : inactiveColor,
          width: 2,
        ),
      ),
    );
  }

  Widget _buildLine(bool isActive) {
    return Container(
      width: lineWidth,
      height: 40,
      color: isActive ? activeColor : inactiveColor.withOpacity(0.3),
    );
  }
}
