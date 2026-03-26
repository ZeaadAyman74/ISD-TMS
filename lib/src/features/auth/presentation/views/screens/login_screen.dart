import 'package:flutter/material.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/features/auth/presentation/views/widgets/login_bloc_listener.dart';
import 'package:isd_tms/src/features/auth/presentation/views/widgets/login_form.dart';
import 'package:isd_tms/src/features/auth/presentation/views/widgets/login_header_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: LoginBlocListener(
                  child: Row(
                    children: [
                      // Left side - illustration (only on wide screens)
                      if (constraints.maxWidth > 600)
                        Expanded(
                          child: Container(
                            color: AppColors.background,
                            child: const LoginHeaderWidget(),
                          ),
                        ),
                      // Right side - form
                      SizedBox(
                        width: constraints.maxWidth > 600
                            ? constraints.maxWidth * 0.45
                            : constraints.maxWidth,
                        child:const LoginForm(),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


