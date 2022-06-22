import 'dart:html';

import 'package:flutter/material.dart';
import './screens/category_meals_screen.dart';
import './screens/Main_screen.dart';
import './screens/meal_details_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromARGB(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                fontFamily: "RobotoCondensed",
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      //home: MainScreen(),
      initialRoute: '/',
      routes: {
        '/':(context) => MainScreen(),
        CategoryMealScreen.routeName:(context) => CategoryMealScreen(),
        MealDetailsScreen.routeName:(context) => MealDetailsScreen(),
      },

      onUnknownRoute: (settings){
        return MaterialPageRoute(builder: (ctx)=>CategoryMealScreen());
      },
    );
  }
}
