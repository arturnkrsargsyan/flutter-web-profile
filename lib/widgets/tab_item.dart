import 'package:flutter/material.dart';

class TabItem extends StatelessWidget {
  const TabItem({
    Key? key,
    required this.tabName,
    required this.isSelected,
  }) : super(key: key);

  final String tabName;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final Color textColor = isSelected
        ? const Color.fromRGBO(52, 64, 84, 1)
        : const Color.fromRGBO(102, 112, 133, 1);

    final Widget body = Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 1),
        child: Text(
          tabName,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );

    return Padding(
      padding: const EdgeInsets.all(4),
      child: isSelected
          ? Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(249, 250, 251, 1),
                borderRadius: BorderRadius.circular(6),
              ),
              child: body,
            )
          : body,
    );
  }
}
