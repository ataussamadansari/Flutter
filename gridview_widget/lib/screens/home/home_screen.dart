import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text("GridView Widget")
            ),
            body: GridView.extent(
                maxCrossAxisExtent: 200,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                padding: EdgeInsets.all(12),
                children: [
                  Image.asset('assets/images/dove.png'),
                  Image.asset('assets/images/dell.png'),
                  Image.asset('assets/images/img_3.png'),
                  Image.asset('assets/images/coca_cola.png'),
                  Image.asset('assets/images/dove.png'),
                  Image.asset('assets/images/dell.png'),
                  Image.asset('assets/images/img_3.png'),
                  Image.asset('assets/images/coca_cola.png'),
                  Image.asset('assets/images/dove.png'),
                  Image.asset('assets/images/dell.png'),
                  Image.asset('assets/images/img_3.png'),
                  Image.asset('assets/images/coca_cola.png'),
                  Image.asset('assets/images/dove.png'),
                  Image.asset('assets/images/dell.png'),
                  Image.asset('assets/images/img_3.png'),
                  Image.asset('assets/images/coca_cola.png')
                ]
            )

          /*GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                padding: EdgeInsets.all(12),
                children: [
                    Image.asset('assets/images/dove.png'),
                    Image.asset('assets/images/dell.png'),
                    Image.asset('assets/images/img_3.png'),
                    Image.asset('assets/images/coca_cola.png'),
                    Image.asset('assets/images/dove.png'),
                    Image.asset('assets/images/dell.png'),
                    Image.asset('assets/images/img_3.png'),
                    Image.asset('assets/images/coca_cola.png'),
                    Image.asset('assets/images/dove.png'),
                    Image.asset('assets/images/dell.png'),
                    Image.asset('assets/images/img_3.png'),
                    Image.asset('assets/images/coca_cola.png'),
                    Image.asset('assets/images/dove.png'),
                    Image.asset('assets/images/dell.png'),
                    Image.asset('assets/images/img_3.png'),
                    Image.asset('assets/images/coca_cola.png')
                ]
            )*/

          /*GridView(
                padding: EdgeInsets.all(12),
                // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                //     crossAxisCount: 2,
                //     crossAxisSpacing: 4,
                //     mainAxisSpacing: 4
                // ),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200),
                children: [
                    Image.asset('assets/images/dove.png'),
                    Image.asset('assets/images/dell.png'),
                    Image.asset('assets/images/img_3.png'),
                    Image.asset('assets/images/coca_cola.png'),
                    Image.asset('assets/images/dove.png'),
                    Image.asset('assets/images/dell.png'),
                    Image.asset('assets/images/img_3.png'),
                    Image.asset('assets/images/coca_cola.png'),
                    Image.asset('assets/images/dove.png'),
                    Image.asset('assets/images/dell.png'),
                    Image.asset('assets/images/img_3.png'),
                    Image.asset('assets/images/coca_cola.png'),
                    Image.asset('assets/images/dove.png'),
                    Image.asset('assets/images/dell.png'),
                    Image.asset('assets/images/img_3.png'),
                    Image.asset('assets/images/coca_cola.png'),
                ]
            )*/
        );
    }
}
