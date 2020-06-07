import 'package:flutter/material.dart';

import 'menu.dart';

class Order with ChangeNotifier{
  Dish dish;
  int amount=0;

}
class Bill with ChangeNotifier{
  List<Order> dishes=[];
  double computePrice(){
    double _price =0;
    for (Order order in dishes){
      _price+= order.dish.price*order.amount;
  }
    notifyListeners();
    return _price;
  }
}