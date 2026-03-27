import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/card_details/card_details_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/card_details/card_detail_header.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/card_details/card_detail_left_section.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/card_details/card_detail_right_section.dart';
import 'package:isd_tms/src/core/di/dependency_injection.dart';

class TaskEditScreen extends StatelessWidget {
  const TaskEditScreen({super.key, required this.card, required this.projectId});

  final CardModel card;
  final int projectId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CardDetailsCubit>()..getCardDetails(projectId, card.id),
      child: Scaffold(
        backgroundColor: context.appColors.scaffoldBackground,
        body: SafeArea(
          child: Column(
            children: [
              CardDetailHeader(card: card),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      if (constraints.maxWidth > 800) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 2,
                              child: CardDetailLeftSection(card: card, projectId: projectId),
                            ),
                            SizedBox(width: 32.w),
                            Expanded(
                              flex: 1,
                              child: CardDetailRightSection(card: card, projectId: projectId),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            CardDetailLeftSection(card: card, projectId: projectId),
                            SizedBox(height: 32.h),
                            CardDetailRightSection(card: card, projectId: projectId),
                          ],
                        );
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
