import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
    TextEditingController name = TextEditingController();
    TextEditingController phone = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    final formKey = GlobalKey<FormState>();
    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text("Form Validation")
            ),
            body: Padding(
                padding: EdgeInsets.all(12),
                child: Form(
                  key: formKey,
                  child: Column(
                      spacing: 12,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                          // Name
                          TextFormField(
                              controller: name,
                              decoration: InputDecoration(
                                  hintText: "John Doe",
                                  labelText: "Name",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
                              ),
                            validator: (value) {
                                if (value == null ||value.isEmpty) {
                                  return "Please enter your name";
                                }
                                return null;
                            },
                          ),
                          // Phone
                          TextFormField(
                              controller: phone,
                              decoration: InputDecoration(
                                  hintText: "9876543210",
                                  labelText: "Phone",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
                              ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Please enter your phone";
                              }
                              if (value.length != 10) {
                                return "Phone number is wrong";
                              }
                              return null;
                            },
                          ),
                          // Email
                          TextFormField(
                              controller: email,
                              decoration: InputDecoration(
                                  hintText: "example@gmail.com",
                                  labelText: "Email Address",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
                              ),
                            validator: (value) {
                              if (value == null ||value.isEmpty) {
                                return "Please enter your email address";
                              }
                              if(!value.contains('@')) {
                                return "Invalid email address";
                              }
                              return null;
                            },
                          ),
                          // Password
                          TextFormField(
                              controller: password,
                              decoration: InputDecoration(
                                  hintText: "********",
                                  labelText: "Password",
                                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))
                              ),
                            validator: (value) {
                              if (value == null ||value.isEmpty) {
                                return "Please enter your password";
                              }
                              if(value.length != 8) {
                                return "Password length are 8 digit";
                              }
                              return null;
                            },
                          ),

                          // Button
                          ElevatedButton(
                              onPressed: () {
                                if(formKey.currentState!.validate()) {
                                  print("Name: ${name.text}");
                                  print("Phone: ${phone.text}");
                                  print("Email: ${email.text}");
                                  print("Password: ${password.text}");
                                }
                              },
                              child: Text("Register")
                          )
                      ]
                  ),
                )
            )
        );
    }
}
