import 'package:flutter/material.dart';

import 'menu.dart';

class Order with ChangeNotifier{
  Dish dish;
  int amount=0;

  Order(this.dish, this.amount);

}
class Bill with ChangeNotifier{
  List<Order> _dishes=[];
  addDish(Dish dish){
    Order order=_dishes.firstWhere((i)=>i.dish==dish,orElse: ()=>null);
    if(order==null){
      order=Order(dish, 0);
      _dishes.add(order);
    }
    order.amount++;
    notifyListeners();
  }
  removeDish(Dish dish){
    Order order=_dishes.firstWhere((i)=>i.dish==dish,orElse: ()=>null);
    if(order==null){
      return ;
    }
    order.amount--;
    if(order.amount==0){
      _dishes.remove(order);
    }
    notifyListeners();
  }
  double computePrice(){
    double _price =0;
    for (Order order in _dishes){
      _price+= order.dish.price*order.amount;
  }
    notifyListeners();
    return _price;
  }
  int selectedAmount(Dish dish){
    Order order=_dishes.firstWhere((i)=>i.dish==dish,orElse: ()=>null);
    if(order==null){
      return 0;
    }
    else
      {
        return order.amount;
      }
  }
  int computeAmount(){
    int totalAmount=0;
    for(Order order in _dishes){
      totalAmount+=order.amount;
    }
    notifyListeners();
    return totalAmount;

  }
  int getLength(){
    return _dishes.length;
  }
  List<Order> getCurrentOrder(){
    return _dishes;
  }
}