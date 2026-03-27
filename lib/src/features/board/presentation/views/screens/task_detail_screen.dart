import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/card_details/card_details_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/card_details/card_detail_header.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/card_details/card_detail_left_section.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/card_details/card_detail_right_section.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/card_details/comment_history_tabs.dart';
import 'package:isd_tms/src/core/di/dependency_injection.dart';

class TaskDetailScreen extends StatelessWidget {
  const TaskDetailScreen({super.key, required this.card, required this.projectId});

  final CardModel card;
  final int projectId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CardDetailsCubit>()..getCardDetails(projectId, card.id),
      child: BlocBuilder<BoardCubit, BoardState>(
        builder: (context, boardState) {
          final currentCard = (boardState is BoardLoaded)
              ? boardState.cards.firstWhere((c) => c.id == card.id, orElse: () => card)
              : (boardState is UpdateCardSuccess && boardState.card.id == card.id)
                  ? boardState.card
                  : card;

          return Scaffold(
            backgroundColor: context.appColors.scaffoldBackground,
            body: SafeArea(
              child: Column(
                children: [
                   CardDetailHeader(card: currentCard),
                   Expanded(
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return SingleChildScrollView(
                          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _MainCardContent(
                                currentCard: currentCard,
                                projectId: projectId,
                                maxWidth: constraints.maxWidth,
                              ),
                              SizedBox(height: 32.h),
                              CommentHistoryTabs(projectId: projectId, cardId: card.id),
                            ],
                          ),
                        );
                      },
                    ),
                   ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _MainCardContent extends StatelessWidget {
  const _MainCardContent({
    required this.currentCard,
    required this.projectId,
    required this.maxWidth,
  });

  final CardModel currentCard;
  final int projectId;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    if (maxWidth > 800) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: CardDetailLeftSection(card: currentCard, projectId: projectId),
          ),
          SizedBox(width: 32.w),
          Expanded(
            flex: 1,
            child: CardDetailRightSection(card: currentCard, projectId: projectId),
          ),
        ],
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardDetailLeftSection(card: currentCard, projectId: projectId),
          SizedBox(height: 32.h),
          CardDetailRightSection(card: currentCard, projectId: projectId),
        ],
      );
    }
  }
}
