import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/board/presentation/views/widgets/board_filter_header/type_filter/types_list.dart';

class TypeFilterBottomSheet extends StatelessWidget {
  const TypeFilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BoardCubit>();
    final types = cubit.cardTypes;
    final selectedTypeKeys = List<String>.from(cubit.selectedTypeKeys);

    return StatefulBuilder(
      builder: (context, setModalState) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          height: 0.6.sh,
          child: Column(
            children: [
              Text(
                'Filter by Type',
                style: context.appTextTheme.font16TextPrimarySemiBold,
              ),
              const Divider(),
              Expanded(
                child: TypesList(
                  types: types,
                  selectedTypeKeys: selectedTypeKeys,
                  onTypeChanged: (key, isSelected) {
                    setModalState(() {
                      if (isSelected) {
                        selectedTypeKeys.add(key);
                      } else {
                        selectedTypeKeys.remove(key);
                      }
                    });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.w),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 45.h),
                  ),
                  onPressed: () {
                    cubit.updateFilters(typeKeys: selectedTypeKeys);
                    Navigator.pop(context);
                  },
                  child: const Text('Apply'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
