import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/extensions/ui_extension.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class AppHtmlField extends StatelessWidget {
  const AppHtmlField({
    super.key,
    required this.controller,
    this.hint,
    this.initialText,
    this.onChange,
  });
  final QuillEditorController controller;
  final String? initialText;
  final String? hint;
 final dynamic Function(String value)? onChange;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // ToolBar(
        //   toolBarColor: AppColors.primaryLight,
        //   // padding: const EdgeInsets.all(8),
        //   iconSize: 20,
        //   iconColor: Colors.black,
        //   activeIconColor: AppColors.primaryLight,
        //   controller: controller,
        //   crossAxisAlignment: WrapCrossAlignment.start,
        //   direction: Axis.horizontal,
        // ),
        ClipRRect(
          borderRadius: 8.br,
          child: QuillHtmlEditor(
            text: initialText,
            hintText: hint,
            controller: controller,
            isEnabled: true,
            minHeight: 180,
            textStyle:context.appTextTheme.font14TextPrimaryRegular,
            hintTextStyle: TextStyle(
              fontSize: 14.sp,
              color: context.appColors.textHint,
            ),
            hintTextAlign: TextAlign.start,
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 5.h),
            hintTextPadding: EdgeInsets.symmetric(
              horizontal: 10.w,
              vertical: 5.h,
            ),
            backgroundColor: context.appColors.secondaryBackground,
            onTextChanged: onChange,
            loadingBuilder: (context) {
              return const Center(
                child: CircularProgressIndicator(strokeWidth: 0.4),
              );
            },
          ),
        ),
      ],
    );
  }
}
