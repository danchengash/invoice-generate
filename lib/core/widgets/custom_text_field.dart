import 'package:flutter/material.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget(
      {Key? key,
      this.keyboardType,
      this.hintStyle,
      this.validator,
      this.maxLine,
      this.onChanged,
      this.controller,
      this.hintText,
      this.labelText,
      this.icon,
      this.labelStyle,
      this.enabled,
      this.prefixIconSize})
      : super(key: key);
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final int? maxLine;
  final Function(String)? onChanged;
  final TextEditingController? controller;
  final String? labelText;
  final String? icon;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool? enabled;
  final Size? prefixIconSize;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText!,
          style: const TextStyle(color: Colors.black),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 0.0),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: Colors.white54,
              border: Border.all(color: Colors.blueAccent, width: 0.5)),
          child: Row(
            children: [
              Expanded(
                  child: TextFormField(
                controller: controller,
                keyboardType: keyboardType,
                validator: validator,
                onTapOutside: (event) => FocusScope.of(context).unfocus(),
                maxLines: maxLine,
                onChanged: onChanged,
                enabled: enabled,
                style: const TextStyle(color: Colors.black),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: hintText,
                  hintStyle: hintStyle ?? const TextStyle(color: Colors.black),
                ),
              )),
            ],
          ),
        ),
      ],
    );
  }
}
