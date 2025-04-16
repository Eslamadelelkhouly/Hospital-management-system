import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:healthmate/core/widgets/custom_app_bar.dart';
import 'package:healthmate/features/AI%20models/data/model/card_ai_model.dart';
import 'package:healthmate/features/home/presentation/views/widgets/card_categories.dart';

class AiModelScreenBody extends StatelessWidget {
  const AiModelScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            30.verticalSpace,
            const CustomAppBar(title: 'AI Models'),
            30.verticalSpace,
            Expanded(
              child: GridView.builder(
                itemCount: cardAiModelList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10.w,
                  mainAxisSpacing: 10.h,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      GoRouter.of(context).push(cardAiModelList[index].route);
                    },
                    child: CardCategories(
                      image: cardAiModelList[index].imgUrl,
                      text: cardAiModelList[index].title,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
