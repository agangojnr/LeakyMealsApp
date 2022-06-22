import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package:flutter/material.dart';
import 'package:leaky_meals_app/dummy_data.dart';
import '../models/category.dart';
import '../widgets/meal_item.dart';

class CategoryMealScreen extends StatelessWidget {
  static const routeName = '/categories-meals';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealScreen(
  //   this.categoryId,
  //   this.categoryTitle,
  // );

  @override
  Widget build(BuildContext context) {
    // final route = ModalRoute.of(context);
    // if(route == null) return SizedBox.shrink();


    final routesArgs = ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryid = routesArgs['id'];
    final categoryTitle = routesArgs['categoryTitle'];

    final filteredCategoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categoryIds.contains(categoryid);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          //return Text(filteredCategoryMeals[index].title);
          return MealItem(
            title: filteredCategoryMeals[index].title,
            imageUrl: filteredCategoryMeals[index].imageUrl,
            duration: filteredCategoryMeals[index].duration,
            complexity: filteredCategoryMeals[index].complexity,
            affordability: filteredCategoryMeals[index].affordability,
          );
        },
        itemCount: filteredCategoryMeals.length,
      ),
    );
  }
}
