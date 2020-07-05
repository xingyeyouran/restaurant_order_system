

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:restaurantordersystem/models/bill.dart';

class CustomerOrderView extends StatelessWidget{
  var height;
  static final routeLocation="/customer_order";
  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("My Order"),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: height*0.8,
            child: CustomerOrder(),
          ),
          CheckOut(),
        ],
      )
    );
  }

}
class CustomerOrder extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<Bill>(builder: (context,order,c)=>
      ListView.separated(
          itemBuilder: (context,index)=>ListTile(
            title: Text("${order.getCurrentOrder()[index].dish.name}" +'           ${order.getCurrentOrder()[index].amount}'),

          ),
          separatorBuilder: (context,_)=>Divider(),
          itemCount: order.getLength())
    );
  }

}

class CheckOut extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return RaisedButton(
      child: Text("Check Out"),
      onPressed: (){
        showDialog(barrierDismissible: true,
          context: context,
          builder: (context)=>SimpleDialog(
            children: <Widget>[
              Image.asset("images/QRimage.png",fit: BoxFit.fill,width: 300,height: 300,)
            ],
          )
        );
      },
    );
  }

}