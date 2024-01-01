// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pppos/core/utilitys/theme.dart';

class SideMenuItem extends StatelessWidget {
  bool selected;
  IconData icon;
  SideMenuItem({
    Key? key,
    required this.selected,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 75,
      height: 50,
      child: Row(
        children: [
          Visibility(
            visible: selected,
            child: VerticalDivider(
              width: 0,
              thickness: 3,
              indent: 8,
              endIndent: 8,
              color:
                  selected ? AppTheme.primary : AppTheme.textPlaceholderColor,
            ),
          ),
          Expanded(
            child: Icon(
              icon,
              color:
                  selected ? AppTheme.primary : AppTheme.textPlaceholderColor,
            ),
          ),
        ],
      ),
    );
  }
}
