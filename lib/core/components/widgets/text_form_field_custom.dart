import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final Widget? label;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final void Function()? onTap;
  final Color? filledColor;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final TextStyle? hintTextStyle;
  final TextStyle? labelTextStyle;
  final InputBorder? border;
  final bool? obscureText;
  final void Function(String)? onFieldSubmitted;
  final bool enabled;
  final InputBorder? errorBorder;
  final TextDirection? hintTextDirection;
  final InputBorder? enabledBorder;
  final InputBorder? disabledBorder;
  final InputBorder? focusedBorder;
  final bool showErrorMessage;
  final int? maxLines;

  const CustomTextFormField({
    this.controller,
    this.validator,
    this.label,
    this.hintText,
    this.labelText,
    this.onChanged,
    this.onTap,
    this.filledColor,
    this.prefixIcon,
    this.suffixIcon,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    super.key,
    this.hintTextStyle,
    this.labelTextStyle,
    this.border,
    String? obscuringCharacter,
    this.obscureText,
    this.onFieldSubmitted,
    this.errorBorder,
    this.hintTextDirection,
    this.enabled = true,
    this.enabledBorder,
    this.disabledBorder,
    this.focusedBorder,
    this.showErrorMessage = true,
    this.maxLines = 1,
  });

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _isTouched = false;
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          onTapOutside: (event) {
            FocusScope.of(context).unfocus();
          },
          onFieldSubmitted: widget.onFieldSubmitted,
          obscuringCharacter: '*',
          obscureText: widget.obscureText ?? false,
          controller: widget.controller,
          validator: (value) {
            final error = widget.validator?.call(value);
            setState(() => _errorMessage = error);
            return error;
          },
          onChanged: (value) {
            if (!_isTouched) {
              setState(() => _isTouched = true);
            }
            // Real-time validation
            final error = widget.validator?.call(value);
            setState(() => _errorMessage = error);
            widget.onChanged?.call(value);
          },
          onTap: () {
            if (!_isTouched) {
              setState(() => _isTouched = true);
            }
            widget.onTap?.call();
          },
          keyboardType: widget.keyboardType,
          textInputAction: widget.textInputAction,
          maxLines: widget.obscureText == true ? 1 : widget.maxLines,
          decoration: InputDecoration(
            focusedBorder: widget.focusedBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    color: _isTouched && _errorMessage != null
                        ? Colors.red
                        : Colors.deepPurple,
                    width: 2,
                  ),
                ),
            disabledBorder: widget.disabledBorder,
            enabledBorder: widget.enabledBorder ??
                OutlineInputBorder(
                  borderSide: BorderSide(
                    color: _isTouched && _errorMessage != null
                        ? Colors.red
                        : Colors.grey[300]!,
                    width: _isTouched && _errorMessage != null ? 2 : 1,
                  ),
                ),
            errorBorder: widget.errorBorder ??
                const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 2),
                ),
            hintTextDirection: widget.hintTextDirection,
            enabled: widget.enabled,
            hintText: widget.hintText,
            labelText: widget.labelText,
            label: widget.label,
            filled: widget.filledColor != null,
            fillColor: widget.filledColor,
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon,
            hintStyle: widget.hintTextStyle,
            labelStyle: widget.labelTextStyle,
            border: widget.border,
          ),
        ),
        // Show error message below field if touched and has error
        if (widget.showErrorMessage && _isTouched && _errorMessage != null)
          Padding(
            padding: EdgeInsets.only(top: 6.h, left: 12.w),
            child: Row(
              children: [
                Icon(Icons.error_outline, size: 14.sp, color: Colors.red),
                SizedBox(width: 6.w),
                Expanded(
                  child: Text(
                    _errorMessage!,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}