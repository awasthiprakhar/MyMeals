import 'package:flutter/material.dart';
//import 'package:flutter_complete_guide/dummy_data.dart';
import 'package:flutter_complete_guide/models/meal.dart';
import 'package:flutter_complete_guide/widgets/meal_item.dart';

class CategoryMealsScreen extends StatefulWidget {
  static const routeName = '/category-meals';

  final List<Meal> availableMeals;
  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String title;
  List<Meal> displayedMeal;
  var _loadFlag = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (!_loadFlag) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      title = routeArgs['title'];
      final id = routeArgs['id'];
      displayedMeal = widget.availableMeals
          .where((element) => element.categories.contains(id))
          .toList();
      super.didChangeDependencies();
      _loadFlag = true;
    }
  }

  void _removeMeal(String mealId) {
    setState(() {
      displayedMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: displayedMeal[index].id,
            title: displayedMeal[index].title,
            duration: displayedMeal[index].duration,
            imageUrl: displayedMeal[index].imageUrl,
            affordability: displayedMeal[index].affordability,
            complexity: displayedMeal[index].complexity,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeal.length,
      ),
    );
  }
}
