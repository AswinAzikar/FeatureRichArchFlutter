import 'package:flutter/material.dart';

class NotificationBanner extends StatefulWidget {
  final String title;
  final String message;
  final Color backgroundColor;
  final IconData icon;
  final Duration duration;
  final VoidCallback? onTap;

  const NotificationBanner({
    Key? key,
    required this.title,
    required this.message,
    this.backgroundColor = Colors.orangeAccent,
    this.icon = Icons.info_outline,
    this.duration = const Duration(seconds: 5),
    this.onTap,
  }) : super(key: key);

  @override
  State<NotificationBanner> createState() => _NotificationBannerState();
}

class _NotificationBannerState extends State<NotificationBanner>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _offsetAnimation = Tween<Offset>(begin: Offset(0.0, -1.0), end: Offset.zero)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();

    Future.delayed(widget.duration, () {
      if (mounted)
        _controller.reverse().then((_) => mounted ? setState(() {}) : null);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Material(
        elevation: 4,
        color: widget.backgroundColor,
        child: InkWell(
          onTap: widget.onTap,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Icon(widget.icon, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        widget.message,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
