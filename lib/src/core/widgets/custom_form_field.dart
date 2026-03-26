import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    this.controller,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.validator,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.labelText,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.maxLines = 1,
    this.minLines,
    this.readOnly = false,
    this.isEnable = true,
    this.fillColor,
    this.contentPadding,
    this.textInputAction,
    this.focusNode,
    this.initialValue,
    this.autoValidateMode,
    this.required=false,
  });

  final TextEditingController? controller;
  final Function(String value)? onChanged;
  final Function(String? value)? onSaved;
  final Function()? onTap;
  final String? Function(String? value)? validator;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? labelText;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final int maxLines;
  final int? minLines;
  final bool readOnly;
  final bool isEnable;
  final Color? fillColor;
  final EdgeInsetsGeometry? contentPadding;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final String? initialValue;
  final AutovalidateMode? autoValidateMode;
  final bool required;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: BorderSide(
        color: context.appColors.secondaryBackground,
        width: 1,
      ),
    );

    final focusedBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(
        color: AppColors.primary,
        width: 1.5,
      ),
    );

    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.r),
      borderSide: const BorderSide(
        color: AppColors.error,
        width: 1,
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) ...[
          Text(
            labelText!,
            style: context.appTextTheme.font14TextPrimarySemiBold,
          ),
          SizedBox(height: 8.h),
        ],
        TextFormField(
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged,
          onSaved: onSaved,
          onTap: onTap,
          readOnly: readOnly,
          obscureText: isPassword,
          keyboardType: keyboardType,
          maxLines: maxLines,
          minLines: minLines,
          enabled: isEnable,
          initialValue: initialValue,
          textInputAction: textInputAction,
          autovalidateMode: autoValidateMode ?? AutovalidateMode.disabled,
          onTapOutside: (event) => FocusScope.of(context).unfocus(),
          validator:validator ?? (required==true?
              (value) {
                if (value == null || value.isEmpty) {
                  return 'This field is required';
                }
                return null;
              }:null),
          style: context.appTextTheme.font14TextPrimaryRegular,
          decoration: InputDecoration(
            isDense: true,
            filled: true,
            fillColor: fillColor ?? context.appColors.cardBackground,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: 14.sp,
              color: context.appColors.textHint,
            ),
            contentPadding: contentPadding ??
                EdgeInsets.symmetric(vertical: 14.h, horizontal: 16.w),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            border: border,
            enabledBorder: border,
            focusedBorder: focusedBorder,
            errorBorder: errorBorder,
            focusedErrorBorder: errorBorder,
            errorStyle: TextStyle(
              fontSize: 11.sp,
              color: context.colorScheme.error,
            ),
          ),
        ),
      ],
    );
  }
}
