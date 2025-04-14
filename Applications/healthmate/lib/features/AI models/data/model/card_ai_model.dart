import 'package:healthmate/core/utils/router_screens.dart';

class CardAiModel {
  final String imgUrl;
  final String title;
  final String route;

  CardAiModel( {required this.route,  required this.imgUrl, required this.title});
}

List<CardAiModel> cardAiModelList = [
  CardAiModel(
    imgUrl: 'assets/images/medical-heart.png',
    title: 'Heart disease',
    route: Routing.kheartdiseasescreen
  ),
  CardAiModel(
    imgUrl: 'assets/images/medical_diabetes.png',
    title: 'Diabtes disease',
    route: Routing.kdiabates
  ),
];
