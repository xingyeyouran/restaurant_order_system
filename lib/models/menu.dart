import 'package:flutter/material.dart';

class Dish{
  String name;
  String description;
  double price;
  String url;

  Dish(this.name, this.description, this.price,this.url);
}

class DishMenu with ChangeNotifier{
  List<Dish> currentMenu=[
    Dish("杀猪菜","色香味俱全",23,"images/KillPig.jpg"),
    Dish("面条","色香味俱全",23,"images/noodles.jpg"),
    Dish("杀猪菜","色香味俱全",23,"images/hawkers.jpg"),

  ];
  fetchMenu() async{
    List<Dish> items=await Future.delayed(Duration.zero,()=>[
      Dish("杀猪菜","色香味俱全",23,"images/KillPig.jpg"),
      Dish("杀猪菜","色香味俱全",23,"images/KillPig.jpg"),
      Dish("杀猪菜","色香味俱全",23,"images/KillPig.jpg"),
      Dish("杀猪菜","色香味俱全",23,"images/KillPig.jpg"),
]);
   currentMenu.addAll(items);
    notifyListeners();
  }
  List<Dish> listMenu(){
    return currentMenu;
  }
}
