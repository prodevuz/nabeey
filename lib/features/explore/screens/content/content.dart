import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nabeey/common/widgets/header/header.dart';
import 'package:nabeey/common/widgets/layouts/grid_layout.dart';
import 'package:nabeey/features/explore/controllers/article_controller.dart';
import 'package:nabeey/features/explore/models/category_model.dart';
import 'package:nabeey/features/explore/screens/article/article.dart';
import 'package:nabeey/features/explore/screens/content/widgets/content_item.dart';
import 'package:nabeey/utils/constants/sizes.dart';

class ContentScreen extends StatelessWidget {
  const ContentScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        /// Category Description
        ADHeader(category: category),

        /// Content Types
        Padding(
          padding: const EdgeInsets.all(ADSizes.defaultSpace),
          child: GridLayout(
            itemCount: 4,
            itemBuilder: (_, index) {
              return GestureDetector(
                onTap: () {
                  switch (index) {
                    case 0:
                      Navigator.push(context, MaterialPageRoute(builder: (_) => BlocProvider(create: (_) => ArticleController(), child: ArticleScreen(category: category))));
                    case 1:
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ArticleScreen(category: category)));
                    case 2:
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ArticleScreen(category: category)));
                    case 3:
                      Navigator.push(context, MaterialPageRoute(builder: (_) => ArticleScreen(category: category)));
                  }
                },
                child: ContentItem(index: index),
              );
            },
          ),
        ),
      ]),
    );
  }
}
