
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantordersystem/models/bill.dart';
import 'package:restaurantordersystem/models/menu.dart';

class Menu extends StatelessWidget{
  static final routeLocation="/menu";
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var length=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          MenuList(),
          BottomTotal()
        ],
      ),
    );
  }

}
class BottomTotal extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<Order>(builder: (_,cuisineOrder,__)=>Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          width: 50,
          color: Colors.redAccent,

        ),
        Container(
          color: Colors.blue,
        )
      ],
    ));
  }

}
class MenuList extends StatefulWidget{

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MenuListState();
  }

}
class MenuListState extends State<MenuList>{
  Bill _bill;
  DishMenu _menu=DishMenu();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadMenu();
  }
  _loadMenu() async{
    Future.delayed(Duration.zero,()=>_menu.fetchMenu());
  }
  @override
  Widget build(BuildContext context) {
    _bill=Provider.of<Bill>(context);
    List<Widget> items=[];
    for(var dish in _menu.currentMenu){
      items.add(Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          SizedBox(
            height: 170,
            width: 200,
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image.asset("${dish.url}"),
//            child: Text("222"),
            ),
          ),
          Center(child: Text("${dish.name}"),),
          Center(child: Text("${dish.description}"),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      width: 84,
                      child: FlatButton(child: Text("▴"), onPressed: () {
                        _bill.removeDish(dish);
                        setState(() {

                        });
                      }),
                    ),
                    Container(width: 16,
                    child: Text("${_bill.selectedAmount(dish)}"),),
                    Container(
                      width: 84,
                      child: Center(
                        child: FlatButton(
                          child: Text("▾"),onPressed: (){
                          _bill.addDish(dish);
                            setState(() {

                            });
                        },
                        ),
                      ),
                    )
                  ],
                ),
                color: Color.fromARGB(255, 242, 248, 248),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)),

                ),
              ),
            ],
          ),
        ],
      ));
    }
    var length=MediaQuery.of(context).size.width;
    // TODO: implement build
    return SizedBox(
      height: 500,
      width: length,
      child: GridView.count(
        crossAxisCount: 2,
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          children: items,
        childAspectRatio: 0.7,
      ),
    );
  }

}