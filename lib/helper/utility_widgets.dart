import 'package:flutter/material.dart';
import 'txt.dart';

abstract class UtilityMaterial {
  static final globalKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String text, {int seconds = 5}) {
    globalKey.currentState!.clearSnackBars();
    globalKey.currentState!.showSnackBar(SnackBar(
        backgroundColor: const Color(0xff002E45),
        margin:
            const EdgeInsets.only(left: 16, top: kToolbarHeight * 3, right: 16),
        width: text.length * 15,
        duration: Duration(seconds: seconds),
        content: Txt(
          text,
          textAlign: TextAlign.center,
        )));
  }

  static Widget txtField(
      {TextEditingController? controller,
      String? hint,
      String? helper,
      String? label,
      Widget? prefixIcon,
      Widget? suffix,
      int? minLines,
      int? maxLines,
      int? maxL,
      String? Function(String?)? validator,
      TextInputType? keyboardType,
      void Function()? onTap,
      void Function(dynamic)? onChanged,
      bool readOnly = false,
      FocusNode? focusNode,
      bool filled = false,
      TextStyle? style,
      Color errorColor = Colors.red,
      Color disabledColor = Colors.grey,
      Color focusColor = Colors.blue,
      Color fillColor = Colors.white,
      bool obscureText = false,
      TextInputAction? textInputAction,
      InputBorder? border,
      Function(String?)? onSaved,
      Function(String?)? onFieldSubmitted,
      EdgeInsetsGeometry? contentPadding =
          const EdgeInsets.fromLTRB(4, 10, 4, 10),
      TextCapitalization textCapitalization = TextCapitalization.none}) {
    var borderRadius = const BorderRadius.all(Radius.circular(8.0));
    final inputDec = InputDecoration(
      filled: filled,
      isDense: true,
      helperText: helper,
      hintStyle: TextStyle(color: Colors.grey.shade500),
      suffixIconConstraints: const BoxConstraints(maxHeight: 24),
      prefixIconConstraints: const BoxConstraints(maxHeight: 24),
      labelText: label,
      prefixIcon: const Text(' http://inews.api/abp/'),
      fillColor: fillColor,
      focusColor: focusColor,
      contentPadding: contentPadding,
      border: border == InputBorder.none
          ? OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide.none,
              borderRadius: borderRadius)
          : OutlineInputBorder(
              gapPadding: 0,
              borderRadius: borderRadius,
              borderSide: BorderSide(color: disabledColor)),
      enabledBorder: border == InputBorder.none
          ? OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide.none,
              borderRadius: borderRadius)
          : OutlineInputBorder(
              gapPadding: 0,
              borderRadius: borderRadius,
              borderSide: BorderSide(color: disabledColor)),
      disabledBorder: border == InputBorder.none
          ? OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide.none,
              borderRadius: borderRadius)
          : OutlineInputBorder(
              gapPadding: 0,
              borderRadius: borderRadius,
              borderSide: BorderSide(color: disabledColor)),
      errorBorder: border == InputBorder.none
          ? OutlineInputBorder(
              gapPadding: 0,
              borderSide: BorderSide.none,
              borderRadius: borderRadius)
          : OutlineInputBorder(
              gapPadding: 0,
              borderRadius: borderRadius,
              borderSide: BorderSide(color: errorColor)),
    );
    return TextFormField(
        onTap: onTap,
        onChanged: onChanged,
        onSaved: onSaved,
        onFieldSubmitted: onFieldSubmitted,
        readOnly: readOnly,
        controller: controller,
        focusNode: focusNode,
        keyboardType: keyboardType,
        style: style,
        scrollPadding: EdgeInsets.zero,
        minLines: minLines,
        maxLines: maxLines,
        maxLength: maxL,
        obscureText: obscureText,
        textCapitalization: textCapitalization,
        textInputAction: textInputAction,
        decoration: inputDec,
        validator: validator);
  }
}
