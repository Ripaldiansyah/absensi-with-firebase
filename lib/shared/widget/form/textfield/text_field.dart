//#TEMPLATE reuseable_text_field
import 'package:flutter/material.dart';
import 'package:hyper_ui/core.dart';

class QTextField extends StatefulWidget {
  const QTextField({
    required this.label,
    required this.onChanged,
    super.key,
    this.id,
    this.value,
    this.validator,
    this.hint,
    this.helper,
    this.maxLength,
    this.maxLines,
    this.onSubmitted,
    this.obscure = false,
    this.enabled = true,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.horizontal,
    this.vertical,
    this.controller,
  });
  final String? id;
  final String label;
  final String? value;
  final String? hint;
  final String? helper;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool enabled;
  final int? maxLength;
  final int? maxLines;
  final double? horizontal;
  final double? vertical;

  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final Function(String) onChanged;
  final Function(String)? onSubmitted;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  @override
  State<QTextField> createState() => _QTextFieldState();
}

class _QTextFieldState extends State<QTextField> {
  late TextEditingController textEditingController;
  bool visible = false;

  @override
  void initState() {
    focusNode = widget.focusNode ?? FocusNode();
    textEditingController = widget.controller ?? TextEditingController();
    textEditingController.text = widget.value ?? '';
    super.initState();
  }

  String getValue() {
    return textEditingController.text;
  }

  setValue(value) {
    textEditingController.text = value;
  }

  resetValue() {
    textEditingController.text = '';
  }

  focus() {
    focusNode.requestFocus();
  }

  late FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    Widget icon = Icon(
      widget.suffixIcon ?? null,
    );

    if (widget.obscure) {
      if (visible) {
        icon = InkWell(
          onTap: () {
            visible = false;
            setState(() {});
          },
          child: icon = const Icon(
            Icons.visibility_off_outlined,
            color: Colors.black,
          ),
        );
      } else {
        icon = InkWell(
          onTap: () {
            visible = true;
            setState(() {});
          },
          child: icon = const Icon(
            Icons.visibility_outlined,
            color: Colors.black,
          ),
        );
      }
    }
    bool isPaddingNull = widget.horizontal == null || widget.horizontal == null;
    return Container(
      margin: const EdgeInsets.only(
        bottom: 20,
      ),
      child: TextFormField(
        enabled: widget.enabled,
        controller: textEditingController,
        focusNode: focusNode,
        validator: widget.validator,
        maxLength: widget.maxLength,
        maxLines: widget.maxLines,
        obscureText: visible == false && widget.obscure,
        decoration: InputDecoration(
          contentPadding: !isPaddingNull
              ? EdgeInsets.symmetric(
                  horizontal: widget.horizontal!,
                  vertical: widget.vertical!,
                )
              : null,
          labelText: widget.label,
          suffixIcon: icon,
          helperText: widget.helper,
          hintText: widget.hint,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              )),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryColor),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              )),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: dangerColor),
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              )),
        ),
        onChanged: (value) {
          widget.onChanged(value);
        },
        onFieldSubmitted: (value) {
          if (widget.onSubmitted != null) widget.onSubmitted!(value);
        },
      ),
    );
  }
}

//#END
