import 'package:flutter/material.dart';
import 'package:healthmate/features/search/presentation/views/widgets/search_screen_body.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SearchScreenBody(),
    );
  }
}
