import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/models/meal.dart';

class FavouritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavouritesMealsNotifier() : super([]);

  bool toggleMealFavouriteStatus(meal) {
    final mealIsFavourite = state.contains(meal);
    if (mealIsFavourite) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favouriteMealProvider =
    StateNotifierProvider<FavouritesMealsNotifier, List<Meal>>((ref) {
  return FavouritesMealsNotifier();
});
