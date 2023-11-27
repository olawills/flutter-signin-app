import 'package:flutter/material.dart';
import 'package:interview/managers/utils/palettes/colors.dart';
import 'package:interview/managers/utils/radius.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    required this.keyboardType,
    this.validator,
    required this.labelText,
    this.isValidationMessage = false,
    this.validationMessage,
    required this.inputController,
    this.suffixIcon = false,
    this.resize = false,
  });
  final String hintText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final String labelText;
  final bool isValidationMessage;
  final String? validationMessage;
  final TextEditingController inputController;
  final bool suffixIcon;
  final bool resize;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool passwordvisibility = false;
  @override
  Widget build(BuildContext context) {
    final inputBorder = OutlineInputBorder(
      borderRadius: AppRadius.knormalBorderRadius,
      borderSide: const BorderSide(color: DesignColors.kDarkGrey, width: 1.5),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: AppRadius.kminiMediumBorderRadius,
      borderSide: const BorderSide(color: DesignColors.kDarkRed, width: 1.5),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.labelText,
          style: const TextStyle(
            fontSize: 17,
            color: Colors.black,
          ),
        ),
        TextFormField(
          controller: widget.inputController,
          keyboardType: widget.keyboardType,
          obscureText: widget.suffixIcon == true ? !passwordvisibility : false,
          style: const TextStyle(),
          validator: widget.validator,
          decoration: InputDecoration(
            prefixIcon: widget.resize
                ? const Icon(
                    Icons.search,
                    color: Colors.black,
                  )
                : null,
            hintText: widget.hintText,
            suffixIcon: widget.suffixIcon
                ? IconButton(
                    onPressed: () => setState(
                      () => passwordvisibility = !passwordvisibility,
                    ),
                    icon: Icon(
                      passwordvisibility
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      color: Colors.black,
                      size: 18,
                    ),
                  )
                : null,
            hintStyle: const TextStyle(),
            disabledBorder: inputBorder,
            enabledBorder: inputBorder,
            focusedErrorBorder: errorBorder,
            errorBorder: errorBorder,
            focusedBorder: inputBorder,
          ),
        ),
        Text(
          widget.isValidationMessage ? widget.validationMessage ?? '' : '',
          style: const TextStyle(),
        )
      ],
    );
  }
}
