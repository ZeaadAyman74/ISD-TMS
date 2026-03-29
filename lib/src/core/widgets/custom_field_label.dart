import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class CustomFieldLabel extends StatelessWidget {
  const CustomFieldLabel({super.key, required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: context.appTextTheme.font14TextPrimarySemiBold),
        SizedBox(height: 8.h),
      ],
    );
  }
}
