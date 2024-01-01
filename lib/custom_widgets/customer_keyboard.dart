// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:pppos/core/utilitys/theme.dart';

class CustomerKeyboard extends StatefulWidget {
  TextEditingController controller;
  CustomerKeyboard({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomerKeyboard> createState() => _CustomerKeyboardState();
}

class _CustomerKeyboardState extends State<CustomerKeyboard> {
  void addKey(String key) {
    setState(() {
      if (key == "delete") {
        widget.controller.text = widget.controller.text.isNotEmpty
            ? widget.controller.text
                .substring(0, widget.controller.text.length - 1)
            : "";
      } else if (key == "enter") {
      } else {
        widget.controller.text += key;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: Column(
        children: [
          //7-8-9
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () => addKey("7"),
                    child: Text(
                      "7",
                      style: AppTheme.font.copyWith(
                          fontSize: 24, color: AppTheme.textTextColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () => addKey("8"),
                    child: Text(
                      "8",
                      style: AppTheme.font.copyWith(
                          fontSize: 24, color: AppTheme.textTextColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () => addKey("9"),
                    child: Text(
                      "9",
                      style: AppTheme.font.copyWith(
                          fontSize: 24, color: AppTheme.textTextColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          //4-5-6
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () => addKey("4"),
                    child: Text(
                      "4",
                      style: AppTheme.font.copyWith(
                          fontSize: 24, color: AppTheme.textTextColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () => addKey("5"),
                    child: Text(
                      "5",
                      style: AppTheme.font.copyWith(
                          fontSize: 24, color: AppTheme.textTextColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () => addKey("6"),
                    child: Text(
                      "6",
                      style: AppTheme.font.copyWith(
                          fontSize: 24, color: AppTheme.textTextColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          //1-2-3
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () => addKey("1"),
                    child: Text(
                      "1",
                      style: AppTheme.font.copyWith(
                          fontSize: 24, color: AppTheme.textTextColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () => addKey("2"),
                    child: Text(
                      "2",
                      style: AppTheme.font.copyWith(
                          fontSize: 24, color: AppTheme.textTextColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () => addKey("3"),
                    child: Text(
                      "3",
                      style: AppTheme.font.copyWith(
                          fontSize: 24, color: AppTheme.textTextColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          //0-enter
          Row(
            children: [
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () => addKey("delete"),
                    child: const Icon(
                      Icons.backspace_outlined,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () => addKey("0"),
                    child: Text(
                      "0",
                      style: AppTheme.font.copyWith(
                          fontSize: 24, color: AppTheme.textTextColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: SizedBox(
                  height: 50,
                  child: OutlinedButton(
                    onPressed: () => addKey("enter"),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      textStyle: AppTheme.font,
                    ),
                    child: Text(
                      "Enter",
                      style: AppTheme.font
                          .copyWith(fontSize: 24, color: AppTheme.backColor),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
