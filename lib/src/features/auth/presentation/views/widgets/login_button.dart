import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:isd_tms/src/core/widgets/custom_button.dart';
import 'package:isd_tms/src/features/auth/presentation/bloc/login_cubit.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();
    return BlocBuilder(
      bloc: cubit,
      builder: (context, state) {
        return CustomButton(
          title: context.localization.login,
          isLoading: state is LoginLoading,
          onTap: cubit.login,
        );
      },
    );
  }
}
