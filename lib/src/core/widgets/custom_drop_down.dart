import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/extensions/ui_extension.dart';
import 'package:isd_tms/src/core/widgets/custom_field_label.dart';

class CustomDropdown<T> extends StatelessWidget {
  const CustomDropdown({
    super.key,
    required this.selectedValue,
    required this.dropdownItems,
    this.hint,
    this.onChanged,
    this.onSave,
    this.validator,
    this.labelText,
    this.labelStyle,
  });

  final T selectedValue;
  final void Function(T?)? onChanged;
  final void Function(T?)? onSave;
  final String? Function(T?)? validator;
  final List<DropdownModel> dropdownItems;
  final String? hint;
  final String? labelText;
  final TextStyle? labelStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (labelText != null) CustomFieldLabel(label: labelText!),
        DropdownButtonFormField<T>(
          isExpanded: true,
          isDense: true,
          borderRadius: 4.br,
          decoration: InputDecoration(
            filled: true,
            fillColor: context.appColors.secondaryBackground,
            // focusColor: Colors.white,
            contentPadding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 12.h,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: 8.br,
              borderSide: BorderSide(
                color: context.appColors.secondaryBackground,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: 8.br,
              borderSide: BorderSide(
                color: context.appColors.secondaryBackground,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: 8.br,
              borderSide: BorderSide(
                color: context.appColors.secondaryBackground,
              ),
            ),
          ),
          icon: Icon(
            Icons.keyboard_arrow_down_rounded,
            color: context.themeData.dividerColor,
            size: 25.w,
          ),
          hint: Text(
            hint ?? '',
            style: context.appTextTheme.font13TextPrimaryMedium,
          ),
          dropdownColor: context.appColors.scaffoldBackground,
          onChanged: onChanged,
          onSaved: onSave,
          validator: validator,
          initialValue: selectedValue,
          items: dropdownItems
              .map(
                (e) => DropdownMenuItem<T>(
                  value: e.value,
                  child: Text(
                    e.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.appTextTheme.font14TextPrimarySemiBold,
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}

class DropdownModel<T> extends Equatable {
  final String title;
  final T value;

  const DropdownModel({required this.title, required this.value});

  @override
  List<Object?> get props => [title, value];
}
