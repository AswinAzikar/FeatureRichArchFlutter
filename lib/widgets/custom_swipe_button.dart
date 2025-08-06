import 'package:flutter/material.dart';

class CustomSwipeButton extends StatefulWidget {
  final VoidCallback onSwipe;
  final double width;
  final double height;
  final BorderRadius borderRadius;
  final Color backgroundColor;
  final Color borderColor;
  final Color thumbColor;
  final Icon thumbIcon;
  final String text;
  final TextStyle? textStyle;
  final double swipeThreshold; // 0.0 - 1.0

  const CustomSwipeButton({
    super.key,
    required this.onSwipe,
    this.width = 300,
    this.height = 60,
    this.borderRadius = const BorderRadius.all(Radius.circular(30)),
    this.backgroundColor = const Color(0xFFEC134A),
    this.borderColor = const Color(0xFFB0003A),
    this.thumbColor = Colors.white,
    this.thumbIcon = const Icon(Icons.arrow_forward, color: Colors.black),
    this.text = 'Swipe to Confirm',
    this.textStyle,
    this.swipeThreshold = 0.8,
  });

  @override
  State<CustomSwipeButton> createState() => _CustomSwipeButtonState();
}

class _CustomSwipeButtonState extends State<CustomSwipeButton> {
  double _dragPosition = 0;
  bool _swiped = false;

  @override
  Widget build(BuildContext context) {
    final maxDrag = widget.width - widget.height;

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: Stack(
        children: [
          Container(
            width: widget.width,
            height: widget.height,
            decoration: BoxDecoration(
              color: widget.backgroundColor,
              border: Border.all(color: widget.borderColor),
              borderRadius: widget.borderRadius,
            ),
            alignment: Alignment.center,
            child: Text(
              _swiped ? "Confirmed" : widget.text,
              style: widget.textStyle ??
                  const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(milliseconds: 0),
            left: _dragPosition,
            top: 0,
            child: GestureDetector(
              onHorizontalDragUpdate: (details) {
                setState(() {
                  _dragPosition += details.delta.dx;
                  if (_dragPosition < 0) _dragPosition = 0;
                  if (_dragPosition > maxDrag) _dragPosition = maxDrag;
                });
              },
              onHorizontalDragEnd: (details) {
                if (_dragPosition > maxDrag * widget.swipeThreshold) {
                  setState(() {
                    _dragPosition = maxDrag;
                    _swiped = true;
                  });
                  widget.onSwipe();
                } else {
                  setState(() {
                    _dragPosition = 0;
                    _swiped = false;
                  });
                }
              },
              child: Container(
                height: widget.height,
                width: widget.height,
                decoration: BoxDecoration(
                  color: widget.thumbColor,
                  borderRadius: widget.borderRadius,
                ),
                child: Center(child: widget.thumbIcon),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
