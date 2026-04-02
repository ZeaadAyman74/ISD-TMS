import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/members/members_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/members/member_card/transfer_ownership_dialog.dart';

class TransferOwnershipButton extends StatelessWidget {
  const TransferOwnershipButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider.value(value: context.read<BoardCubit>()),
              BlocProvider.value(value: context.read<MembersCubit>()),
            ],
            child: const TransferOwnershipDialog(),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.w),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.deepOrange.withValues(alpha: .1),
        ),
        padding: EdgeInsets.all(5.w),
        child: Icon(
          Icons.change_circle_outlined,
          color: Colors.deepOrange,
          size: 20.w,
        ),
      ),
    );
  }
}

