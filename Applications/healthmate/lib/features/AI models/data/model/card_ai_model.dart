class CardAiModel {
  final String imgUrl;
  final String title;

  CardAiModel({required this.imgUrl, required this.title});
}


List<CardAiModel> cardAiModelList = [
  CardAiModel(
    imgUrl: 'assets/images/medical-heart.png',
    title: 'Heart disease',
  ),
];