import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantordersystem/Screens/menu_mimic.dart';
import 'package:restaurantordersystem/models/table.dart';

class Rtables extends StatelessWidget{
  static final routeLocation="/tables";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: UseableTable(),
    );
  }

}

class UseableTable extends StatelessWidget{
  Tables _tables;
  @override
  Widget build(BuildContext context) {
    _tables=Provider.of<Tables>(context);
    List<Widget> getTables(){
      List<Widget> availableTables=[];
      for( RestaurantTable t in _tables.tables){
        var container=GestureDetector(
          onTap:() {
            if (t.ready) {
              Navigator.pushNamed(
                  context, CuisineView.routeLocation, arguments: t.id);
            }
            else{
              showDialog(
                context: context,
                builder: (context)=>AlertDialog(
                  title: Text("under using!"),
                  actions: <Widget>[
                    FlatButton(onPressed: (){
                      Navigator.of(context).pop();
                    }, child: Text("I got it"))
                  ],
                )
              );
            }
          },

          child: Container(
            color: t.ready?Colors.greenAccent:Colors.redAccent,
            child: Center(child: Text("${t.id}",style: TextStyle(fontSize: 24),)),

          ),
        );
        availableTables.add(container);
      }
      return availableTables;
    }
    // TODO: implement build
    return Consumer<Tables>(
        builder: (context,tables,c)=>GridView.extent(

          maxCrossAxisExtent: 150,
          childAspectRatio: 1,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          children: getTables(),
        ));
  }

}