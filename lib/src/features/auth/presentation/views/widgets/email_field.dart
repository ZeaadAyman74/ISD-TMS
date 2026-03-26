import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/core/utils/app_validator.dart';
import 'package:isd_tms/src/core/widgets/custom_form_field.dart';
import 'package:isd_tms/src/features/auth/presentation/bloc/login_cubit.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class EmailField extends StatelessWidget {
  const EmailField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return CustomFormField(
      labelText: context.localization.email_label,
      hintText: context.localization.email_hint,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      prefixIcon: Padding(
        padding: EdgeInsets.only(left: 12.w, right: 8.w),
        child: Icon(
          Icons.email_outlined,
          color: AppColors.textHint,
          size: 20.r,
        ),
      ),
      validator: (value) {
        return AppFormValidator.requiredField(value, context.localization.email_required) ??
            AppFormValidator.emailValidation(value, context.localization.invalid_email);
      },
      onSaved: (value) {
        cubit.loginModel.email = value;
      },
    );
  }
}
