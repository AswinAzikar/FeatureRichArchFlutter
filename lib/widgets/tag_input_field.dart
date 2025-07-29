import 'package:flutter/material.dart';

class TagInputField extends StatefulWidget {
  final List<String> initialTags;
  final ValueChanged<List<String>> onChanged;
  final String hintText;
  final bool allowDuplicates;
  final int? maxTags;

  const TagInputField({
    Key? key,
    this.initialTags = const [],
    required this.onChanged,
    this.hintText = 'Enter tag and press enter',
    this.allowDuplicates = false,
    this.maxTags,
  }) : super(key: key);

  @override
  State<TagInputField> createState() => _TagInputFieldState();
}

class _TagInputFieldState extends State<TagInputField> {
  final TextEditingController _controller = TextEditingController();
  late List<String> _tags;

  @override
  void initState() {
    super.initState();
    _tags = [...widget.initialTags];
  }

  void _addTag(String tag) {
    tag = tag.trim();
    if (tag.isEmpty) return;

    if (!widget.allowDuplicates && _tags.contains(tag)) return;
    if (widget.maxTags != null && _tags.length >= widget.maxTags!) return;

    setState(() {
      _tags.add(tag);
      _controller.clear();
    });
    widget.onChanged(_tags);
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
    });
    widget.onChanged(_tags);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 8,
          runSpacing: -8,
          children: _tags.map((tag) {
            return Chip(
              label: Text(tag),
              deleteIcon: const Icon(Icons.close),
              onDeleted: () => _removeTag(tag),
            );
          }).toList(),
        ),
        TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: widget.hintText,
          ),
          onSubmitted: _addTag,
          onChanged: (text) {
            if (text.endsWith(' ')) {
              _addTag(text);
            }
          },
        ),
      ],
    );
  }
}
