class ReorderCardsRequestModel {
  final List<int> cardsIds;

  ReorderCardsRequestModel({required this.cardsIds});

  Map<String, dynamic> toJson() {
    return {'card_ids': cardsIds};
  }
}
