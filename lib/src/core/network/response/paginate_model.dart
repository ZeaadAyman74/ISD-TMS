import 'package:equatable/equatable.dart';

class PaginateModel extends Equatable {
  const PaginateModel({
    required this.hasMore,
    required this.current,
    required this.totalPages,
    required this.totalItems,
  });

  final bool hasMore;
  final int current;
  final int totalPages;
  final int totalItems;

  factory PaginateModel.fromJson(Map<String, dynamic> json) {
    if(json['page']==null){
      return const PaginateModel(hasMore: false, current: 0, totalPages: 0, totalItems: 0);
    }
    return PaginateModel(
      hasMore: json['page'] < json['total_pages'],
      current: json['page'] ?? 0,
      totalPages: json['total_pages'] ?? 0,
      totalItems: json['total'] ?? 0,
    );
  }


  @override
  List<Object?> get props => [
    hasMore,
    current,
    totalPages,
    totalItems,
  ];
}
