import 'package:flutter/material.dart';

class ExpandingSearchBar extends StatefulWidget {
  final Function(String) onSearch;
  final String hintText;
  final Color backgroundColor;
  final TextStyle? textStyle;

  const ExpandingSearchBar({
    super.key,
    required this.onSearch,
    this.hintText = 'Search...',
    this.backgroundColor = Colors.white,
    this.textStyle,
  });

  @override
  ExpandingSearchBarState createState() => ExpandingSearchBarState();
}

class ExpandingSearchBarState extends State<ExpandingSearchBar> {
  bool _isFocused = false;
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      width: _isFocused ? MediaQuery.of(context).size.width * 0.8 : 56.0,
      height: 40.0,
      curve: Curves.easeInOut,
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                _isFocused = !_isFocused;
              });
            },
          ),
          Expanded(
            child: _isFocused
                ? TextField(
                    controller: controller,
                    style: widget.textStyle ??
                        TextStyle(fontSize: 16, color: Colors.black),
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      border: InputBorder.none,
                    ),
                    onChanged: (query) {
                      widget.onSearch(query);
                    },
                  )
                : SizedBox(),
          ),
        ],
      ),
    );
  }
}
