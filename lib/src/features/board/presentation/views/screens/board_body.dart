import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/widgets/app_loading.dart';
import 'package:isd_tms/src/core/widgets/error_state_widget.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/board_bloc_listener.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/board_column_widget.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/board_filter_header/board_filter_header.dart';

class BoardBody extends StatefulWidget {
  const BoardBody({super.key,required this.projectId});
final int projectId;
  @override
  State<BoardBody> createState() => _BoardBodyState();
}

class _BoardBodyState extends State<BoardBody> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _tabCount = 0;

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  void _initTabController(int count) {
    if (_tabCount != count) {
      _tabController?.dispose();
      _tabCount = count;
      _tabController = TabController(length: count, vsync: this);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BoardBlocListener(
      child: BlocBuilder<BoardCubit, BoardState>(
        buildWhen: (prev, curr) =>
        curr is BoardLoading || curr is BoardLoaded || curr is BoardError,
        builder: (context, state) {
          if (state is BoardLoading) {
            return const AppLoading();
          }
          if (state is BoardError) {
            return ErrorStateWidget(
              message: state.error,
              onRetry: () =>
                  context.read<BoardCubit>().getBoard(),
            );
          }
          if (state is BoardLoaded) {
            if (state.lists.isEmpty) {
              return Center(
                child: Text(
                  context.localization.no_board_columns,
                  style: context.appTextTheme.font16TextPrimarySemiBold.copyWith(
                    color: context.appColors.textSecondary,
                  ),
                ),
              );
            }
            _initTabController(state.lists.length);
            return Column(
              children: [
                const BoardFilterHeader(),
                TabBar(
                  controller: _tabController,
                  isScrollable: true,
                  tabAlignment: TabAlignment.start,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: context.appColors.primary,
                  labelPadding: EdgeInsets.symmetric(horizontal: 16.w),
                  labelColor: context.appColors.primary,
                  unselectedLabelColor: context.appColors.textSecondary,
                  labelStyle: context.appTextTheme.font14TextPrimarySemiBold,
                  tabs: state.lists.asMap().entries.map((entry) {
                    final index = entry.key;
                    final list = entry.value;
                    return DragTarget<CardModel>(
                      onWillAcceptWithDetails: (details) {
                        if (_tabController?.index != index) {
                          _tabController?.animateTo(index);
                        }
                        return true;
                      },
                      onAcceptWithDetails: (details) {
                        final card = details.data;
                        if (card.listId != list.id) {
                          final cubit = context.read<BoardCubit>();
                          final targetCards = cubit.getCardsForList(list.id);
                          cubit.moveCard(
                            cardId: card.id,
                            targetListId: list.id,
                            targetPosition: targetCards.length,
                          );
                        }
                      },
                      builder: (context, candidateData, rejectedData) {
                        return Tab(text: list.title);
                      },
                    );
                  }).toList(),
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: state.lists.map((list) {
                      return Padding(
                        padding: EdgeInsets.all(16.w),
                        child: BoardColumnWidget(boardList: list, projectId: widget.projectId),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
