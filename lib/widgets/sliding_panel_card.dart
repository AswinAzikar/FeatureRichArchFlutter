import 'package:flutter/material.dart';

class SlidingPanelCard extends StatefulWidget {
  final Widget header;
  final Widget body;
  final Duration duration;
  final Curve curve;
  final bool initiallyExpanded;
  final Color backgroundColor;
  final EdgeInsets padding;

  const SlidingPanelCard({
    super.key,
    required this.header,
    required this.body,
    this.duration = const Duration(milliseconds: 300),
    this.curve = Curves.easeInOut,
    this.initiallyExpanded = false,
    this.backgroundColor = Colors.white,
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  State<SlidingPanelCard> createState() => _SlidingPanelCardState();
}

class _SlidingPanelCardState extends State<SlidingPanelCard>
    with SingleTickerProviderStateMixin {
  late bool _expanded;

  @override
  void initState() {
    super.initState();
    _expanded = widget.initiallyExpanded;
  }

  void _toggle() {
    setState(() {
      _expanded = !_expanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: widget.backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Column(
        children: [
          InkWell(
            onTap: _toggle,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Padding(
              padding: widget.padding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  widget.header,
                  Icon(
                    _expanded ? Icons.expand_less : Icons.expand_more,
                    color: Colors.grey[600],
                  ),
                ],
              ),
            ),
          ),
          AnimatedCrossFade(
            duration: widget.duration,
            crossFadeState: _expanded
                ? CrossFadeState.showFirst
                : CrossFadeState.showSecond,
            firstChild: Padding(
              padding: widget.padding,
              child: widget.body,
            ),
            secondChild: Container(),
            firstCurve: widget.curve,
            secondCurve: widget.curve,
          ),
        ],
      ),
    );
  }
}
