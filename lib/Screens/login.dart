import 'package:restaurantordersystem/Screens/Table.dart';
import 'package:restaurantordersystem/Screens/menu_mimic.dart';
import 'package:flutter/material.dart';
import 'package:restaurantordersystem/Screens/menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login extends StatefulWidget{
  static final routeLocation="/";
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return LoginState();
  }

}
class LoginState extends State<Login>{
  String userName;
  String password;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
  _login() async{
    String _assumedPassword="";
    SharedPreferences preferences= await SharedPreferences.getInstance();
    preferences.get("Passworda")??preferences.setString("Passworda", "123");
    _assumedPassword=preferences.get("Passworda");
    if(userName=="1"&&password=="1"){
      Navigator.of(context).pushNamed(Rtables.routeLocation);
    }
  }
  @override
  Widget build(BuildContext context) {
    var mediaWidth=MediaQuery.of(context).size.width;
    // TODO: implement build
    return Scaffold(
      body:GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: (){
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: Container(
          padding: EdgeInsets.fromLTRB(29, 20, 29, 0),
          width: mediaWidth,
          decoration: BoxDecoration(
            color: Colors.white
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 200,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: Image.asset("images/logo.png",),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "登录",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Form(
                  key:_formKey ,
                  child: Column(
                children: <Widget>[
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("用户名",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400
                          ),),
                      ),
                      Container(padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: TextFormField(
                            onSaved: (String value){
                              userName=value;
                            },
                            obscureText: false ,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.perm_identity)
                            ),
                          ))
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(left: 20),
                        child: Text("密码",
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w400
                          ),),
                      ),
                      Container(padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                          child: TextFormField(
                            onSaved: (String value){
                              password=value;
                            },
                            obscureText: false ,
                            decoration: InputDecoration(
                                suffixIcon: Icon(Icons.lock)
                            ),
                          ))
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 43,
                    child: FlatButton (
                      color: Colors.brown,
                      child: Center(child: Text("登录",style: TextStyle(color: Colors.white,fontSize: 17),)),
                      onPressed: (){
                        _formKey.currentState.save();
                        _login();
                      },
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }

}
class LoginInputArea extends StatelessWidget{
  final pass=TextEditingController();
  final uName=TextEditingController();
  final Icon icon;
  final String input;
  final bool cypher;
  LoginInputArea(this.input,this.icon,this.cypher);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20),
          child: Text("$input",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w400
          ),),
        ),
        Container(padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextFormField(
              onSaved: (String value){
                cypher?LoginState().password=value:LoginState().userName=value;
              },
              obscureText: cypher?true:false ,
              decoration: InputDecoration(
                suffixIcon: icon
              ),
            ))
      ],
    );
  }
  
}