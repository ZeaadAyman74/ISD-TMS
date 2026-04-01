import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';

class BoardSearchField extends StatefulWidget {
  const BoardSearchField({super.key});

  @override
  State<BoardSearchField> createState() => _BoardSearchFieldState();
}

class _BoardSearchFieldState extends State<BoardSearchField> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _searchController,
      onChanged: (value) {
        context.read<BoardCubit>().updateFilters(search: value);
      },
      onTapOutside:  (event) => FocusScope.of(context).unfocus(),
      decoration: InputDecoration(
        hintText: context.localization.search_cards_hint,
        prefixIcon: const Icon(Icons.search, size: 20),
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 8.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: context.appColors.secondaryBackground),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.r),
          borderSide: BorderSide(color: context.appColors.secondaryBackground),
        ),
      ),
    );
  }
}
