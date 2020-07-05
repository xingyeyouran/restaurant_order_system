
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:restaurantordersystem/Screens/CustomerOrder.dart';
import 'package:restaurantordersystem/Screens/Table.dart';
import 'package:restaurantordersystem/Screens/login.dart';
import 'package:restaurantordersystem/Screens/menu.dart';
import 'package:restaurantordersystem/models/bill.dart';
import 'package:restaurantordersystem/Screens/menu_mimic.dart';
import 'package:restaurantordersystem/models/menu.dart';
import 'package:restaurantordersystem/models/table.dart';
void main() {
  runApp(AppEntrance());
}
class AppEntrance extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    // TODO: implement build
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context)=>Tables()),
        ChangeNotifierProvider(
          create: (context)=>Bill(),
        ),
        ChangeNotifierProvider(create: (context)=>DishMenu(),
        )
      ],
      child: MaterialApp(
        initialRoute: Login.routeLocation,
        routes: {
          CustomerOrderView.routeLocation:(context)=>CustomerOrderView(),
          Rtables.routeLocation:(context)=>Rtables(),
          Login.routeLocation:(context)=>Login(),
          Menu.routeLocation:(context)=>Menu(),
          CuisineView.routeLocation:(context)=>CuisineView(),

        },

      ),

    );
  }

}