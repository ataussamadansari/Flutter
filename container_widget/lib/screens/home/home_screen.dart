import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text("Container Widget"),
                backgroundColor: Colors.orangeAccent
            ),
            body: Container(
                height: 100,
                width: 200,
                margin: EdgeInsets.all(30),
                padding: EdgeInsets.all(12),
                // constraints: BoxConstraints(
                //   maxHeight: 200,
                //   maxWidth: 300
                // ),
                /*child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.indigo,
                ),*/

                // color: Colors.indigoAccent, //if use decoration don't write color separate
                decoration: BoxDecoration(
                    // color: Colors.indigoAccent,
                    borderRadius: BorderRadius.circular(12),
                    // border: Border.all(color: Colors.deepOrangeAccent, width: 2),
                    boxShadow: [
                        BoxShadow(
                            color: Colors.black.withAlpha(50),
                            blurRadius: 10,
                            offset: Offset(5, 5)
                        )
                    ],
                    // shape: BoxShape.circle,
                    /*gradient: LinearGradient(
                        colors: [
                            Colors.red,
                            Colors.orange
                        ],
                      // begin: Alignment.topRight,
                      // end: Alignment.bottomLeft
                    ),*/

                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage("https://picsum.photos/500")
                    )
                )
            )
        );
    }
}
