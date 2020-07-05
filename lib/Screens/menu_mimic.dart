import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurantordersystem/Screens/CustomerOrder.dart';
import 'package:restaurantordersystem/models/bill.dart';
import 'package:restaurantordersystem/models/menu.dart';

class CuisineView extends StatelessWidget{
  static final routeLocation="/cuisine";
  @override
  Widget build(BuildContext context) {
    var _height=MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          BannerWidgetArea(),
          SizedBox(
            height: 10,
          ),
          Container(
              height: _height*0.4,
              child: DetailedMenu()),
          TotalCost()
        ],
      )),
    );
  }

}
class DetailedMenu extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return DetailedMenuState();
  }

}

class DetailedMenuState extends State<DetailedMenu>{
  Bill _order;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    _order=Provider.of<Bill>(context);
    // TODO: implement build
    return Consumer<DishMenu>(builder: (context,cuisine,child)=>cuisine.listMenu().length>3?
    ListView.separated(
        primary: true,
        shrinkWrap: true,
        itemBuilder: (context,index)=>Container(
          padding: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 5.0,
                spreadRadius: 2.0
                
              )
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              ClipRRect(
                borderRadius: BorderRadius.only(topLeft: Radius.circular(12.0),bottomLeft:  Radius.circular(12.0)),
                child: Image.asset(cuisine.listMenu()[index].url,fit: BoxFit.cover,width: 80,height: 80,),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Text("${cuisine.listMenu()[index].name}",style: TextStyle(fontSize: 18.0),),
                  Padding(
                    padding: const EdgeInsets.only(top: 4.0,bottom: 4.0),
                    child: Text("${cuisine.listMenu()[index].description}",style: TextStyle(color: Colors.black54,fontSize: 14.0),),
                  ),
                  Text("${cuisine.listMenu()[index].price}",style: TextStyle(color: Colors.black54,fontSize: 14.0),),
                ],
              ),
              Padding(padding: EdgeInsets.only(left: 140),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: 40,
                          child: FlatButton(onPressed: (){
                            _order.addDish(cuisine.listMenu()[index]);
                          }, child: Text("▴",style: TextStyle(fontSize: 20)),)),
                      Container(
                        width: 16,
                        child: Text("${_order.selectedAmount(cuisine.listMenu()[index])}"),
                      ),
                      Container(
                        width: 40,
                          child: FlatButton(onPressed: (){
                            _order.removeDish(cuisine.listMenu()[index]);
                          }, child: Text("▾",style: TextStyle(fontSize: 20),))),
                    ],
                  )
                ],
              )
              )
            ],
          ),
        ),
        separatorBuilder:(_,__)=>Divider(
          indent: 4.0,
          height: 28.0,
        ),
        itemCount: cuisine.listMenu().length):Center(child: CircularProgressIndicator()));
  }

}

class BannerWidgetArea extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return BannerWidgetAreaStateA();
  }

}

class TotalCost extends StatelessWidget{
  @override
  var _width;
  var _height;
  Widget build(BuildContext context) {
    final int desk=ModalRoute.of(context).settings.arguments;
    _width=MediaQuery.of(context).size.width;
    _height=MediaQuery.of(context).size.height;
    // TODO: implement build
    return Consumer<Bill>(builder: (context,order,c)=>Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: _height*0.129,
                width: _width*0.2,
                color: Colors.greenAccent,
                child: Center(child: Text("NO.${desk}",style: TextStyle(
                  fontSize: 25
                ))),
              ),
              Container(
                height: _height*0.129,
                width: _width*0.6,
                color: Colors.lightBlueAccent,
                child: Center(child: Row(
                  children: <Widget>[
                    Text("     ${order.computeAmount()}",style: TextStyle(
                      fontSize: 25
                    ),),
                    Text("Items"),
                    Text("       ${order.computePrice()}",style: TextStyle(
                      fontSize: 25
                    ),),
                    Text("RMB")
                  ],
                )),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.pushNamed(context, CustomerOrderView.routeLocation);
                },
                child: Container(
                  height: _height*0.129,
                  width: _width*0.2,
                  color: Colors.greenAccent,
                  child: Center(
                    child: Text("Order",style: TextStyle(
                      fontSize: 25
                    ),),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }

}


class BannerWidgetAreaStateA extends State<BannerWidgetArea>{
  DishMenu dishMenu;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadMenu();
  }
  _loadMenu(){
    Future.delayed(Duration.zero,()=>dishMenu.fetchMenu());
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    dishMenu=Provider.of<DishMenu>(context);
    List<Widget> banners=new List<Widget>();
    for( Dish item in dishMenu.listMenu()){
      var bannerView=Padding(
        padding: EdgeInsets.all(10.0),
        child: Container(
          child: Stack(
            fit: StackFit.expand,
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black38,
                          blurRadius: 5.0,
                          spreadRadius: 1.0
                      )
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(20.0),
                    )
                ),
              ),
              ClipRRect(
                  borderRadius:BorderRadius.all(Radius.circular(20.0)) ,
                  child: Image.asset(item.url,fit: BoxFit.cover,)),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    gradient: LinearGradient(
                      colors: [Colors.transparent,Colors.black],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,

                    )
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(item.name,style: TextStyle(color: Colors.white,fontSize: 25.0),),
                    Text("40% off",style: TextStyle(color: Colors.white,fontSize: 12.5),)
                  ],
                ),
              )
            ],
          ),
        ),
      );
      banners.add(bannerView);
    }
    PageController pageController=new PageController(viewportFraction: 0.8,initialPage: 1);
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth=MediaQuery.of(context).size.width;
    // TODO: implement build
    return Container(
      width: screenWidth,
      height: screenWidth*9/16,
      child: PageView(
        controller: pageController,
        scrollDirection: Axis.horizontal,
        children: banners,
      ),
    );
  }

}