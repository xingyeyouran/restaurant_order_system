
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:restaurantordersystem/Screens/login.dart';
import 'package:restaurantordersystem/Screens/menu.dart';
import 'package:restaurantordersystem/models/bill.dart';

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
          create: (context)=>Bill(),
        )
      ],
      child: MaterialApp(
        initialRoute: Login.routeLocation,
        routes: {
          Login.routeLocation:(context)=>Login(),
          Menu.routeLocation:(context)=>Menu(),
        },

      ),

    );
  }

}