import 'package:flutter/material.dart';
import 'package:my_bud/constants/theme_data.dart';

class InputFields extends StatefulWidget {
  final String title;
  final String placeholder;
  final bool isPassword;
  final Function(String)? onChanged;
  final controller;
  const InputFields({
    required this.title,
    required this.placeholder,
    required this.isPassword,
    required this.onChanged,
    required this.controller,
    super.key,
  });

  @override
  State<InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.w800,
            color: blkOpacity,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        TextField(
          controller: widget.controller,
          onChanged: widget.onChanged,
          obscureText: widget.isPassword,
          style: const TextStyle(
            fontSize: 14,
          ),
          decoration: InputDecoration(
            filled: true,
            fillColor: greyOpacity,
            focusedBorder: outlineBorder,
            enabledBorder: outlineBorder,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
            hintText: widget.placeholder,
            hintStyle: const TextStyle(fontSize: 12),
            suffixIcon: widget.isPassword
                ? IconButton(
                    onPressed: () => print('hello'),
                    icon: Icon(
                      Icons.visibility,
                      color: Theme.of(context).primaryColor,
                    ),
                  )
                : const SizedBox(),
          ),
        ),
      ],
    );
  }
}
