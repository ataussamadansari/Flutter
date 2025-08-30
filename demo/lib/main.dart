import 'package:flutter/material.dart';

void main()
{
    runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
    const MyApp({super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context)
    {
        return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent)
            ),
            home: const MyHomePage(title: 'Flutter Basic')
        );
    }
}

class MyHomePage extends StatefulWidget
{
    const MyHomePage({super.key, required this.title});
    final String title;

    @override
    State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
{

    @override
    Widget build(BuildContext context)
    {
        var arrNames = ['Samad', 'Aman', 'Akash', 'Shubham', 'Sam', 'Ansari', 'Adarsh', 'Akash', 'Shubham', 'Sam', 'Ansari', 'Adarsh'];
        return Scaffold(
            appBar: AppBar(
                backgroundColor: Theme.of(context).colorScheme.inversePrimary,
                title: Text(widget.title)
            ),
            body: Center(
                child: Column(
                    children: [
                        Text(
                            "Custom Font",
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Poppins'
                            )
                        ),
                        Text(
                            "Custom Font",
                            style: TextStyle(
                                fontSize: 25,
                                fontFamily: 'Macondo'
                            )
                        ),
                    ]
                )
            )

        /// Circle Image
            /*Center(
                child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/img_2.png'),
                    backgroundColor: Colors.redAccent,
                    radius: 100,
                    child: Text("App Name", style: TextStyle(
                            fontSize: 20, 
                            fontWeight: FontWeight.w400, 
                            color: Colors.white, fontFamily: 'Poppins')
                    )
                )
            )*/

        /// ListTile
          /* ListView.separated(itemBuilder: (context, index) {
              return ListTile(
                leading: Text('${index+1}'),
                title: Text(arrNames[index]),
                subtitle: Text('${index+1}'),
                trailing: Icon(Icons.add),
              );
            }, separatorBuilder: (context, index) {
              return Divider(height: 20, thickness: 1);
            }, itemCount: arrNames.length)*/

        /// Margin + Padding
          /*Container(
                color: Colors.blueAccent,
                margin: EdgeInsets.all(12),
                child: Padding(
                    padding: EdgeInsets.all(8),
                    child: Text("Hello World!", style: TextStyle(
                            fontSize: 25,
                            color: Colors.white,
                            fontWeight: FontWeight.w500
                        )
                    )
                )
            )*/

        /// Padding
          /*Padding(
              padding: EdgeInsets.only(left: 30, top: 30),
              child: Text("Hello World!", style: TextStyle(
                      fontSize: 25
                  )
              ),
            )*/

        /// Expanded with Column
            /*Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 2,
                    child: Container(
                        color: Colors.blue
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                        color: Colors.blueGrey
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                        color: Colors.orangeAccent
                    ),
                  ),
                  Expanded(
                    child: Container(
                        color: Colors.green
                    ),
                  ),
                ]
            )*/

        /// Expanded with Row
            /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                          width: 50,
                          height: 100,
                          color: Colors.blue
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Container(
                          width: 50,
                          height: 100,
                          color: Colors.blueGrey
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Container(
                          width: 50,
                          height: 100,
                          color: Colors.orangeAccent
                      ),
                    ),
                    Expanded(
                      child: Container(
                          width: 50,
                          height: 100,
                          color: Colors.green
                      ),
                    ),
                ]
            )*/

        /// ListView.builder
            /*ListView.builder(itemBuilder: (context, index)
                {
                    return Text(arrNames[index], style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500));
                },
                itemCount: arrNames.length
            )*/

        /// ListView.separated
            /*ListView.separated(itemBuilder: (context, index)
                {
                    return Text(arrNames[index], style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500));
                },
                itemCount: arrNames.length,
                separatorBuilder: (context, index) {
                return Divider(height: 1, thickness: 2,);
                },
            )*/

        /// ListView
            /*ListView(
                reverse: true,
                scrollDirection: Axis.horizontal,
                children: [
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                            "One",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400
                            )
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                            "Two",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400
                            )
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                            "Three",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400
                            )
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                            "Four",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400
                            )
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                            "Five",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400
                            )
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                            "Six",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400
                            )
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                            "Seven",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400
                            )
                        )
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8),
                        child: Text(
                            "Eight",
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w400
                            )
                        )
                    )
                ]
            )*/

        /// Row and Column apply scroll
            /*Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                    child: Column(
                        children: [
                            Padding(
                                padding: const EdgeInsets.only(bottom: 8),
                                child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                  child: Row(
                                      children: [
                                          Container(
                                              margin: EdgeInsets.only(right: 11),
                                              height: 250,
                                              width: 200,
                                              color: Colors.deepOrange
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(right: 11),
                                              height: 250,
                                              width: 200,
                                              color: Colors.greenAccent
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(right: 11),
                                              height: 250,
                                              width: 200,
                                              color: Colors.pink
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(right: 11),
                                              height: 250,
                                              width: 200,
                                              color: Colors.green
                                          ),
                                          Container(
                                              margin: EdgeInsets.only(right: 11),
                                              height: 250,
                                              width: 200,
                                              color: Colors.yellow
                                          )
                                      ]
                                  ),
                                )
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: 11),
                                height: 250,
                                color: Colors.amber
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: 11),
                                height: 250,
                                color: Colors.green
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: 11),
                                height: 250,
                                color: Colors.lightBlue
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: 11),
                                height: 250,
                                color: Colors.orange
                            ),
                            Container(
                                margin: EdgeInsets.only(bottom: 11),
                                height: 250,
                                color: Colors.pink
                            )
                        ]
                    )
                )
            )*/

        /// Inkwell with container + text
            /*Center(
                child: InkWell(
                    onTap: ()
                    {
                        print("on Tap! Container");
                    },
                    child: Container(
                        width: 200,
                        height: 100,
                        color: Colors.blueAccent,
                        child: Center(
                          child: InkWell(
                              onTap: ()
                              {
                                  print("on Tap! Text");
                              },
                              child: Text("Text Field btn", style: TextStyle(
                                      fontSize: 20
                                  ))
                          ),
                        )
                    )
                )
            )*/

        /// text field with inkwell
            /*Center(
                child: InkWell(
                    onTap: (){
                        print("on Tap!");
                    },
                    onDoubleTap: (){
                        print("on Double Tap!");
                    },
                    onLongPress: (){
                        print("on Long Press!");
                    },
                    child: Text("Text Field btn"),
                ),
            )*/

        /// Inkwell with Container
            /*Center(
                child: InkWell(
                    onLongPress: ()
                    {
                        print("Long pressed!");
                    },
                    onTap: ()
                    {
                        print("Tap!");
                    },
                    onDoubleTap: ()
                    {
                        print("Double tap!");
                    },
                    child: Container(
                        width: 200,
                        height: 100,
                        color: Colors.amber
                    )
                )
            )*/

        ///
            /*Container(
                width: 300,
              color: Colors.blueGrey,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                      Text("A", style: TextStyle(fontSize: 25)),
                      Text("B", style: TextStyle(fontSize: 25)),
                      Text("C", style: TextStyle(fontSize: 25)),
                      Text("D", style: TextStyle(fontSize: 25)),
                      Text("E", style: TextStyle(fontSize: 25)),
                      ElevatedButton(onPressed: ()
                          {
                              print("Elevated btn clicked!");
                          }, child: Text("Click!"))
                  ]
              ),
            )*/

        /// 
            /*Container(
                height: 500,
                color: Colors.redAccent,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Text("A", style: TextStyle(fontSize: 25)),
                        Text("B", style: TextStyle(fontSize: 25)),
                        Text("C", style: TextStyle(fontSize: 25)),
                        Text("D", style: TextStyle(fontSize: 25)),
                        Text("E", style: TextStyle(fontSize: 25)),
                        ElevatedButton(onPressed: ()
                            {
                                print("Elevated btn clicked!");
                            }, child: Text("Click!"))
                    ]
                )
            )*/

        /// with multiple widgets this is by default
            /*Column(
                children: <Widget>[
                    Text("A", style: TextStyle(fontSize: 25)),
                    Text("B", style: TextStyle(fontSize: 25)),
                    Text("C", style: TextStyle(fontSize: 25)),
                    Text("D", style: TextStyle(fontSize: 25)),
                    Text("E", style: TextStyle(fontSize: 25)),
                    ElevatedButton(onPressed: ()
                        {
                            print("Elevated btn clicked!");
                        }, child: Text("Elevated Btn!"))
                ]
            )*/

        /// with specific widgets
            /*Column(
                children: <Text>[
                    Text("A", style: TextStyle(fontSize: 25),),
                    Text("B", style: TextStyle(fontSize: 25),),
                    Text("C", style: TextStyle(fontSize: 25),),
                    Text("D", style: TextStyle(fontSize: 25),),
                    Text("E", style: TextStyle(fontSize: 25),),
                    // ElevatedButton(onPressed: onPressed, child: child) // The element type 'ElevatedButton' can't be assigned to the list type 'Text'.
                ],
            )*/

        /// Row
            /*Row(
                children: [
                    Text("A", style: TextStyle(fontSize: 25),),
                    Text("B", style: TextStyle(fontSize: 25),),
                    Text("C", style: TextStyle(fontSize: 25),),
                    Text("D", style: TextStyle(fontSize: 25),),
                    Text("E", style: TextStyle(fontSize: 25),),
                ],
            )*/

        /// Column
            /*Column(
                children: [
                    Text("A", style: TextStyle(fontSize: 25),),
                    Text("B", style: TextStyle(fontSize: 25),),
                    Text("C", style: TextStyle(fontSize: 25),),
                    Text("D", style: TextStyle(fontSize: 25),),
                    Text("E", style: TextStyle(fontSize: 25),),
                ],
            )*/

        /// Row and Column with Image, Container, Center, etc.
            /*Center(
                child: Column(
                    children: [
                        Container(
                            width: 100,
                            height: 100,
                            child: Image.asset('assets/images/img_2.png')
                        ),
                        Container(
                            width: 100,
                            height: 100,
                            child: Image.asset('assets/images/body_care.png')
                        )
                    ]
                )
            )*/

        /// Image
            /*Center(
                child: Container(
                    width: 200,
                    height: 200,
                    child: Image.asset('assets/images/body_care.png')
                )
            )*/

        /// Outlined Button
            /*OutlinedButton(onPressed: ()
                {
                    print("Outlined Btn clicked!");
                }, child: Text("Outlined Btn")
            )*/

        /// ElevatedButton
            /*ElevatedButton(onPressed: ()
                {
                    print("Elevated btn clicked!");
                },
                onLongPress: (){
                    print("LongPressed btn click!");
                },
                child: Text("Elevated Btn!")
            )*/

        /// TextButton
            /*TextButton(onPressed: ()
                {
                    print("Text btn clicked!");
                },
                onLongPress: ()
                {
                    print("LongPressed btn click!");
                },
                child: Text("Click Me!")
            )*/

        /// Text center of container
          /*Center(
              child: Container(
                  width: 200,
                  height: 100,
                  color: Colors.redAccent,

                child: Center(
                  child: Text("This is center of container.", style: TextStyle(
                    color: Colors.white
                  ),),
                ),

              ),
            )*/

        /// Text
          /*Center(
              child: Text("Hello Flutter Devs!", style: TextStyle(
                      // color: Colors.blueAccent,
                      // fontWeight: FontWeight.w900,
                      // backgroundColor: Colors.redAccent,
                      fontSize: 25
                  )
              ),
            )*/

        /// Container
          /*Center(
                child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.amberAccent,
                    child: Text("Hello Flutter!")
                )
            )*/
        // This trailing comma makes auto-formatting nicer for build methods.
        );
    }
}
