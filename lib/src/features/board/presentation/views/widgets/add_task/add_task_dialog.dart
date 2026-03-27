import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/theme/app_colors.dart';
import 'package:isd_tms/src/core/widgets/custom_button.dart';
import 'package:isd_tms/src/core/widgets/custom_form_field.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';

class AddTaskDialog extends StatefulWidget {
  const AddTaskDialog({
    super.key,
    required this.listId,
    required this.listTitle,
  });

  final int listId;
  final String listTitle;

  @override
  State<AddTaskDialog> createState() => _AddTaskDialogState();
}

class _AddTaskDialogState extends State<AddTaskDialog> {
  final _titleController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      child: Container(
        width: 400.w,
        padding: EdgeInsets.all(24.r),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  Icon(Icons.add_task, color: context.appColors.primary, size: 24.r),
                  SizedBox(width: 8.w),
                  Text(
                    context.localization.add_task,
                    style: context.appTextTheme.font18TextPrimarySemiBold,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.close,
                        size: 20.r, color: context.appColors.textHint),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Text(
                '${context.localization.adding_to}${widget.listTitle}',
                style: context.appTextTheme.font12TextSecondarySemiBold,
              ),
              SizedBox(height: 20.h),

              // Title field
              CustomFormField(
                controller: _titleController,
                labelText: context.localization.task_title,
                hintText: context.localization.enter_task_title,
                textInputAction: TextInputAction.done,
              ),

              SizedBox(height: 24.h),

              // Buttons
              Row(
                children: [
                  Expanded(
                    child: CustomButton(
                      title: context.localization.cancel,
                      backgroundColor: Colors.grey.shade100,
                      titleStyle: TextStyle(
                        color: AppColors.textSecondary,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      onTap: () => Navigator.pop(context),
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: BlocConsumer<BoardCubit, BoardState>(
                      listener: (context, state) {
                        if (state is AddCardSuccess) {
                          Navigator.pop(context);
                        }
                      },
                      buildWhen: (prev, curr) =>
                          curr is AddCardLoading ||
                          curr is AddCardSuccess ||
                          curr is AddCardError ||
                          curr is BoardLoaded,
                      builder: (context, state) {
                        return CustomButton(
                          title: context.localization.create,
                          isLoading: state is AddCardLoading,
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              context.read<BoardCubit>().addCard(
                                    title: _titleController.text.trim(),
                                    listId: widget.listId,
                                  );
                            }
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
