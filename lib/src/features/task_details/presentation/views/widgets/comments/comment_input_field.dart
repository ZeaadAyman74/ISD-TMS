import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:isd_tms/src/core/extensions/context_extensions.dart';
import 'package:isd_tms/src/core/widgets/app_html_field.dart';
import 'package:isd_tms/src/features/board/data/models/board_models.dart';
import 'package:isd_tms/src/features/board/presentation/bloc/board_cubit.dart';
import 'package:isd_tms/src/features/task_details/presentation/bloc/task_details_cubit.dart';
import 'package:isd_tms/src/features/task_details/presentation/views/widgets/fields/save_field_button.dart';
import 'package:quill_html_editor/quill_html_editor.dart';

class CommentInputField extends StatefulWidget {
  const CommentInputField({super.key});

  @override
  State<CommentInputField> createState() => _CommentInputFieldState();
}

class _CommentInputFieldState extends State<CommentInputField> {
  TaskDetailsCubit get cubit => context.read<TaskDetailsCubit>();
  late QuillEditorController controller;
  bool _showMentionPopup = false;
  String _mentionQuery = '';

  @override
  void initState() {
    controller = QuillEditorController();
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final Map<String, BoardMember> _mentionsMap = {};
  List<BoardMember> get _filteredMembers {
    final members = context.read<BoardCubit>().members;
    if (_mentionQuery.isEmpty) return members;
    return members
        .where((m) => m.name.toLowerCase().contains(_mentionQuery.toLowerCase()))
        .toList();
  }

  bool _isSettingText = false;

  void _onTextChanged(String html) {
    if (_isSettingText) return;

    // 1. Validate existing mentions
    final validatedHtml = _validateMentionsContent(html);
    if (validatedHtml != html) {
      _isSettingText = true;
      controller.setText(validatedHtml).then((_) {
        _isSettingText = false;
      });
      return; // Stop here as we've just reset the text
    }

    // 2. Mention detection
    final plainText = html.replaceAll(RegExp(r'<[^>]*>'), '');
    final lastAtIndex = plainText.lastIndexOf('@');

    if (lastAtIndex != -1) {
      final query = plainText.substring(lastAtIndex + 1);
      if (!query.contains(' ')) {
        setState(() {
          _mentionQuery = query;
          _showMentionPopup = true;
        });
        return;
      }
    }

    if (_showMentionPopup) {
      setState(() => _showMentionPopup = false);
    }
  }

  String _validateMentionsContent(String html) {
    final members = context.read<BoardCubit>().members;
    if (members.isEmpty) return html;
    
    final mentionRegex = RegExp(
      r'<span[^>]*?class=["'']mention-badge["''][^>]*?data-mention-id=["''](\d+)["''][^>]*?>(.*?)</span>',
      caseSensitive: false,
      dotAll: true,
    );

    var newHtml = html;
    final matches = mentionRegex.allMatches(html);

    for (final match in matches) {
      final mentionFullTag = match.group(0)!;
      final mentionId = int.parse(match.group(1)!);
      var mentionText = match.group(2)!;
      
      // Clean up and normalize mention text
      mentionText = mentionText
          .replaceAll(RegExp(r'<[^>]*>'), '')
          .replaceAll('&nbsp;', ' ')
          .replaceAll(RegExp(r'\s+'), ' ')
          .trim();

      // Find the member
      final member = members.where((m) => m.userId == mentionId || m.id == mentionId).firstOrNull;

      if (member != null) {
        final expectedText = '@${member.name}'
            .replaceAll(RegExp(r'\s+'), ' ')
            .trim();
        
        if (mentionText.toLowerCase() != expectedText.toLowerCase()) {
          // Keep the span, just fix text if needed
          final correctedTag =
              '<span class="mention-badge" data-mention-id="$mentionId">$mentionText</span>';
          newHtml = newHtml.replaceFirst(mentionFullTag, correctedTag);        }
      } else {
        final correctedTag =
            '<span class="mention-badge" data-mention-id="$mentionId">$mentionText</span>';
        newHtml = newHtml.replaceFirst(mentionFullTag, correctedTag);      }
    }

    return newHtml;
  }

  Future<void> _insertMention(BoardMember member) async {
    final currentHtml = await controller.getText();
    final plainText = currentHtml.replaceAll(RegExp(r'<[^>]*>'), '');

    final lastAtIndex = plainText.lastIndexOf('@');
    if (lastAtIndex == -1) return;

    final before = plainText.substring(0, lastAtIndex);

    // 🔥 unique key
    final mentionKey = '@${member.name}';

    _mentionsMap[mentionKey] = member;

    final newText = '$before$mentionKey ';

    _isSettingText = true;
    await controller.setText('<p>$newText</p>');
    _isSettingText = false;

    setState(() => _showMentionPopup = false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16.h),
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: context.appColors.secondaryBackground,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: context.appColors.secondaryBackground),
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              AppHtmlField(
                controller: controller,
                hint: context.localization.add_comment_hint,
                initialText: '',
                onChange: _onTextChanged,
              ),
              if (_showMentionPopup && _filteredMembers.isNotEmpty)
                Positioned(
                  bottom: -10.h, // Show above the editor
                  left: 0,
                  right: 0,
                  child: Container(
                    constraints: BoxConstraints(maxHeight: 200.h),
                    decoration: BoxDecoration(
                      color: context.appColors.cardBackground,
                      borderRadius: BorderRadius.circular(8.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.1),
                          blurRadius: 10,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: _filteredMembers.length,
                      itemBuilder: (context, index) {
                        final member = _filteredMembers[index];
                        return ListTile(
                          leading: CircleAvatar(
                            radius: 12.r,
                            backgroundColor: context.appColors.primary,
                            child: Text(
                              member.initials,
                              style: TextStyle(fontSize: 10.sp, color: Colors.white),
                            ),
                          ),
                          title: Text(
                            member.name,
                            style: context.appTextTheme.font14TextPrimaryRegular,
                          ),
                          onTap: () => _insertMention(member),
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
          Row(
            children: [
              const Spacer(),
              SaveFieldButton(
                title: context.localization.comments,
                onPressed: _onSave,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _onSave() async {
    final html = await controller.getText();

    if (html.isEmpty || html == '<p><br></p>') return;

    String result = html;

    _mentionsMap.forEach((text, member) {
      result = result.replaceAll(
        text,
        '<span class="mention-badge" data-mention-id="${member.userId}">$text</span>',
      );
    });

    cubit.addComment(result);
    controller.clear();
    _mentionsMap.clear();
  }
}
