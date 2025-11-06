import 'package:book_store_mvvm/core/components/widgets/text_custom.dart';
import 'package:flutter/material.dart';

class TextButtonCustom extends StatelessWidget {
  const TextButtonCustom({
    super.key,
    required this.text,
    required this.onPressed,
    this.clipBehavior,
    this.onFocusChange,
    this.alignment,
    this.animationDuration,
    this.elevation,
    this.backgroundColor,
    this.iconColor,
    this.shape,
    this.backgroundBuilder,
    this.textStyle,
    this.side,
    this.padding,
    this.textColor,
    this.backgroundColorTextColor,
    this.textAlign,
    this.decoration,
    this.softWrap,
    this.fontSize,
    this.overflow,
    this.fontWeight,
  });

  final String text;
  final void Function()? onPressed;
  final Function(bool)? onFocusChange;
  final Clip? clipBehavior;
  final AlignmentGeometry? alignment;
  final Duration? animationDuration;
  final double? elevation;
  final Color? backgroundColor;
  final Color? iconColor;
  final OutlinedBorder? shape;
  final Widget Function(BuildContext, Set<WidgetState>, Widget?)? backgroundBuilder;
  final TextStyle? textStyle;
  final BorderSide? side;
  final EdgeInsetsGeometry? padding;
  final Color? textColor;
  final Color? backgroundColorTextColor;
  final TextAlign? textAlign;
  final TextDecoration? decoration;
  final bool? softWrap;
  final FontWeight? fontWeight;
  final double? fontSize;
  final TextOverflow? overflow;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        alignment: alignment,
        animationDuration: animationDuration,
        elevation: elevation,
        backgroundColor: backgroundColor,
        iconColor: iconColor,
        shape: shape,
        backgroundBuilder: backgroundBuilder,
        textStyle: textStyle,
        side: side,
        padding: padding,
      ),
      onFocusChange: onFocusChange,
      clipBehavior: clipBehavior,
      onPressed: onPressed,
      child: TextCustom(
        text: text,
        color: textColor,
        backgroundColor: backgroundColorTextColor,
        textAlign: textAlign,
        decoration: decoration,
        softWrap: softWrap,
        fontWeight: fontWeight,
        fontSize: fontSize,
        overflow: overflow,
      ),
    );
  }
}
