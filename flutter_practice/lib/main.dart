import 'package:flutter/material.dart';

void main()
{
    runApp(MyApp());
}

class MyApp extends StatelessWidget
{
    @override
    Widget build(BuildContext context) 
    {
        return MaterialApp(
            title: "Flutter Basic",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                useMaterial3: false,
                primarySwatch: Colors.red
            ),
            home: DashBoardScreen()
        );
    }

}

class DashBoardScreen extends StatelessWidget
{
    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(
                title: Text("Flutter Basic")
            ),
            body: Container(
              width: double.infinity,
              height: double.infinity,
              // color: Colors.blueGrey,
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.lightBlue,
                    border: Border.all(color: Colors.black, width: 2, style: BorderStyle.solid),
                    // borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
                    // borderRadius: BorderRadius.circular(11),
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 11,
                        spreadRadius: 5,
                        color: Colors.grey
                      )
                    ],
                    shape: BoxShape.circle
                  ),
                ),
              ),
            )
        );
    }

}
