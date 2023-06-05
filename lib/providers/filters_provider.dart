
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:testagain/providers/meals_provider.dart';

enum Filter {
  aaaaa,
  bbbbb,
  ccccc,
  ddddd
}
class FiltersNotifier extends StateNotifier<Map<Filter,bool>>{ // take object <Map<Filter,bool>> ==> use ref.watch(Xprovider)
  FiltersNotifier() : super({
    Filter.aaaaa : false,
    Filter.bbbbb : false,
    Filter.ccccc : false,
    Filter.ddddd : false,
  });

  void setFilters(Map<Filter,bool> choosenFilter){ // call method ==> use ref.read(Xprovider.notifier)
    state = choosenFilter;
  }
  void setFilter(Filter filter, bool isActive){
    //state[filter] = isActive; // not allowed => mutating state;
    state = {
      ...state,
      filter: isActive
    };
  }
}

final filtersProvider = StateNotifierProvider<FiltersNotifier,Map<Filter,bool>>(
  (ref) => FiltersNotifier());

final filteredMealsProvider = Provider((ref) {
  final meals = ref.watch(mealsProvider);
  final activeFilters = ref.watch(filtersProvider);
  return meals.where((meal) {
      if(activeFilters[Filter.aaaaa]! && !meal.isGlutenFree){
        return false;
      }
      if(activeFilters[Filter.bbbbb]! && !meal.isLactoseFree){
        return false;
      }
      if(activeFilters[Filter.ccccc]! && !meal.isVegetarian){
        return false;
      }
      if(activeFilters[Filter.ddddd]! && !meal.isVegan){
        return false;
      }
      return true;
    }).toList();
});