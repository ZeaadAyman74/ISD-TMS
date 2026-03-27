import 'package:flutter/material.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class AppBackButton extends StatelessWidget {
  const AppBackButton({super.key,this.onTab});
final VoidCallback? onTab;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back_ios, size: 18),
      onPressed:onTab?? () => context.pop(),
    );
  }
}
