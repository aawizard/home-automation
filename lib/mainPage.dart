import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Connect.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    String state1 = '';
    String device;
    BoltIOT boltIOT = new BoltIOT();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () async {
              var state=await boltIOT.digitalRead("0");
              setState(() async{
                state1=state["value"];
              });
            },
          ),
        ],
      ),
      body:Container(
        child: SafeArea(
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("Control for light 1"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FlatButton(
                    onPressed: () async {
                      await boltIOT.digitalWrite("0", "HiGH");
                      var state=await boltIOT.digitalRead("0");
                      setState(() async{
                        state1=state["value"];
                      });
                    },
                    child: Text(
                      "ON",
                    ),
                    color:state1=="1"? Colors.green:Colors.grey,
                  ),
                  FlatButton(
                    onPressed: () async {
                      await boltIOT.digitalWrite("0", "LOW");
                      var state=await boltIOT.digitalRead("0");
                      setState(() async{
                        state1=state["value"];
                      });
                    },
                    child: Text(
                      "OFF",
                    ),
                    color:state1=="1"?Colors.grey: Colors.red,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
