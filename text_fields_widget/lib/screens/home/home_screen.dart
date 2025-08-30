import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text("Text Fields Widget"),
                backgroundColor: Colors.green
            ),
            body: Column(
                spacing: 12,
                children: [
                    SizedBox(height: 100),
                    TextField(
                        controller: email,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            hintText: "Enter your email",
                            labelText: "Email",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            prefixIcon: Icon(Icons.email_outlined),
                            suffixIcon: IconButton(
                                onPressed: () {
                                    email.clear();
                                },
                                icon: Icon(Icons.close)
                            )
                        )
                    ),


                    TextField(
                        controller: password,
                        obscureText: true,
                        obscuringCharacter: '*',
                        textAlignVertical: TextAlignVertical.bottom,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            hintText: "Enter your password",
                            labelText: "Password",
                            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                            prefixIcon: Icon(Icons.lock_outline),
                            suffixIcon: IconButton(
                                onPressed: () {
                                    password.clear();
                                },
                                icon: Icon(Icons.close)
                            )
                        )
                    ),

                  // description
                  TextField(
                      maxLines: 7,
                      decoration: InputDecoration(
                          hintText: "Enter your description",
                          labelText: "Description",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                      )
                  ),

                    ElevatedButton(
                        onPressed: ()
                        {
                            print(email.text);
                        },
                        child: Text('Login')
                    )
                ]
            )
        );
    }
}

