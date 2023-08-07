import 'package:flutter/material.dart';

class SimpleInputField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final IconData? iconData;

  const SimpleInputField(
      {super.key,
      required this.controller,
      required this.title,
      required this.hintText, this.iconData});

  @override
  State<SimpleInputField> createState() => _SimpleInputFieldState();
}

class _SimpleInputFieldState extends State<SimpleInputField> {
  static const Color containerColor = Color(0xffF5F8F8);
  static const Color textBlack = Color(0xff232323);
  static const Color textLightBlack = Color(0xff717171);
  static const Color clearButtonColor = Color(0xffFF7511);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
              color: textBlack, fontSize: 15, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w300,
                color: textLightBlack),
            suffixIcon: widget.iconData!=null ? Icon(
              widget.iconData,
              color: textLightBlack,
            ) : const Text(''),
            filled: true,
            fillColor: containerColor,
            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          onFieldSubmitted: (value) {
            if (value.isEmpty) {
              widget.controller.text = '0.00';
            } else {
              widget.controller.text = value.toString();
            }
            setState(() {});
          },
          validator: (value) {
            return  'Please enter a valid amount';
          },
        ),
      ],
    );
  }
}
