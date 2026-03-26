import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/core/utils/app_validator.dart';
import 'package:isd_tms/src/core/widgets/custom_form_field.dart';
import 'package:isd_tms/src/features/auth/presentation/bloc/login_cubit.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class PasswordField extends StatelessWidget {
  const PasswordField({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return BlocBuilder(
      bloc: cubit,
      buildWhen: (prev, curr) => curr is TogglePasswordVisibility,
      builder: (context, state) {
        return CustomFormField(
          labelText: context.localization.password_label,
          hintText: context.localization.password_hint,
          isPassword: !cubit.passwordVisible,
          textInputAction: TextInputAction.done,
          prefixIcon: Padding(
            padding: EdgeInsets.only(left: 12.w, right: 8.w),
            child: Icon(Icons.lock_outline, color: AppColors.textHint, size: 20.r),
          ),
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 12.w),
            child: GestureDetector(
              onTap: cubit.togglePasswordVisibility,
              child: Icon(
                cubit.passwordVisible
                    ? Icons.visibility_outlined
                    : Icons.visibility_off_outlined,
                color: AppColors.textHint,
                size: 20.r,
              ),
            ),
          ),
          validator: (value) =>
              AppFormValidator.requiredField(value, context.localization.password_required),
          onSaved: (value) {
            cubit.loginModel.password = value;
          },
        );
      },
    );
  }
}
