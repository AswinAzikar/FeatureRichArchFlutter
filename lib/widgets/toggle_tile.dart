import 'package:flutter/material.dart';

class ToggleTile extends StatefulWidget {
  final String title;
  final String? subtitle;
  final bool initialValue;
  final ValueChanged<bool> onChanged;
  final IconData? leadingIcon;
  final Color? activeColor;
  final Color? tileColor;
  final bool enabled;

  const ToggleTile({
    Key? key,
    required this.title,
    required this.initialValue,
    required this.onChanged,
    this.subtitle,
    this.leadingIcon,
    this.activeColor,
    this.tileColor,
    this.enabled = true,
  }) : super(key: key);

  @override
  State<ToggleTile> createState() => _ToggleTileState();
}

class _ToggleTileState extends State<ToggleTile> {
  late bool _currentValue;

  @override
  void initState() {
    super.initState();
    _currentValue = widget.initialValue;
  }

  void _toggle() {
    if (!widget.enabled) return;
    setState(() => _currentValue = !_currentValue);
    widget.onChanged(_currentValue);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      enabled: widget.enabled,
      tileColor: widget.tileColor,
      leading: widget.leadingIcon != null
          ? Icon(widget.leadingIcon, color: widget.enabled ? null : Colors.grey)
          : null,
      title: Text(widget.title),
      subtitle: widget.subtitle != null ? Text(widget.subtitle!) : null,
      trailing: Switch(
        value: _currentValue,
        onChanged: widget.enabled ? (val) => _toggle() : null,
        activeColor: widget.activeColor,
      ),
      onTap: _toggle,
    );
  }
}
