import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/auth/presentation/bloc/login_cubit.dart';
import 'package:isd_tms/src/features/auth/presentation/views/widgets/email_field.dart';
import 'package:isd_tms/src/features/auth/presentation/views/widgets/login_button.dart';
import 'package:isd_tms/src/features/auth/presentation/views/widgets/password_field.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w, vertical: 48.h),
      child: Form(
        key: cubit.formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Logo & Welcome
            Center(
              child: Column(
                children: [
                  Icon(
                    Icons.task_alt_rounded,
                    size: 48.r,
                    color: AppColors.primary,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    context.localization.welcome_title,
                    style: context.appTextTheme.font22TextPrimaryBold,
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    context.localization.welcome_subtitle,
                    textAlign: TextAlign.center,
                    style: context.appTextTheme.font14TextSecondaryRegular,
                  ),
                ],
              ),
            ),
            40.verticalSpace,
            const EmailField(),
            20.verticalSpace,
            const PasswordField(),
            32.verticalSpace,
            const LoginButton(),
          ],
        ),
      ),
    );
  }
}
