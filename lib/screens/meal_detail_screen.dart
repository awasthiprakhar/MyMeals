import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meals-detail';

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal =
        DUMMY_MEALS.firstWhere((element) => element.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.title}'),
      ),
      body: Column(children: [
        Container(
          height: 200,
          width: double.infinity,
          child: Image.network(selectedMeal.imageUrl, fit: BoxFit.fill),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Ingredients"),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.lightGreen),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(2),
          height: 200,
          width: 250,
          child: ListView.builder(
            itemBuilder: (ctx, index) => Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(selectedMeal.ingredients[index]),
              ),
            ),
            itemCount: selectedMeal.ingredients.length,
          ),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Steps"),
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.green),
            borderRadius: BorderRadius.circular(10),
          ),
          margin: EdgeInsets.all(5),
          padding: EdgeInsets.all(2),
          height: 200,
          width: 250,
          child: ListView.builder(
            itemBuilder: (ctx, index) => ListTile(
              leading: CircleAvatar(
                child: Text("# ${(index + 1)}"),
              ),
              title: Text(
                selectedMeal.steps[index],
              ),
            ),
            itemCount: selectedMeal.steps.length,
          ),
        )
      ]),
    );
  }
}
