

import 'package:flutter/material.dart';

class RestaurantTable{
  bool ready;
  int id;

  RestaurantTable(this.ready, this.id);

}
class Tables with ChangeNotifier{
  List<RestaurantTable> _tables=[
    RestaurantTable(true,1),
    RestaurantTable(false,2),
    RestaurantTable(false,3),
    RestaurantTable(false,4),
    RestaurantTable(false,5),
    RestaurantTable(true,6),
    RestaurantTable(true,7),
    RestaurantTable(true,8),
    RestaurantTable(true,9),
  ];
  List<RestaurantTable> get tables => _tables;
  useTable(int tableID){

  }


}