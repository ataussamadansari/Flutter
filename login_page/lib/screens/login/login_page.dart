import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget
{
    const LoginScreen({super.key});

    @override
    State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    bool passwordVisible = true;
    final formKey = GlobalKey<FormState>();

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            body: Form(
                key: formKey,
                child: Stack(
                    children: [
                        Positioned(
                            top: -100,
                            right: -100,
                            child: Container(
                                width: 300,
                                height: 300,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.indigoAccent.withAlpha(100)
                                )
                            )
                        ),
                        Positioned(
                            top: -90,
                            right: -90,
                            child: Container(
                                width: 250,
                                height: 250,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.indigoAccent.withAlpha(100)
                                )
                            )
                        ),
                        ListView(
                            padding: EdgeInsets.all(12),
                            children: [
                                SizedBox(height: 50),
                                FlutterLogo(size: 100),
                                SizedBox(height: 12),
                                Text(
                                    "Welcome Back!",
                                    style: TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold
                                    )
                                ),

                                SizedBox(height: 4),
                                Text(
                                    "Please enter your email and password to login"
                                ),

                                SizedBox(height: 18),
                                TextFormField(
                                    controller: email,
                                    decoration: InputDecoration(
                                        hintText: "Email",
                                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                                        prefixIcon: Icon(Icons.email_outlined),
                                        suffixIcon: email.text.isNotEmpty ? IconButton(onPressed: ()
                                                {
                                                    setState(()
                                                        {
                                                            email.clear();
                                                        }
                                                    );
                                                }, icon: Icon(Icons.clear)) : null
                                    ),
                                    onChanged: (value)
                                    {
                                        setState(()
                                            {
                                            }
                                        );
                                    },
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.emailAddress,
                                    validator: (value)
                                    {
                                        if (value == null || value.isEmpty)
                                        {
                                            return 'Please enter your email';
                                        }
                                        if (!value.contains('@') || !value.contains('.'))
                                        {
                                            return 'Please enter a valid email';
                                        }
                                        return null;
                                    }
                                ),
                                SizedBox(height: 12),
                                TextFormField(
                                    controller: password,
                                    decoration: InputDecoration(
                                        hintText: "Password",
                                        border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12))),
                                        prefixIcon: Icon(Icons.password),
                                        suffixIcon: IconButton(onPressed: ()
                                            {
                                                setState(()
                                                    {
                                                        passwordVisible = !passwordVisible;
                                                    }
                                                );
                                            }, icon: Icon(!passwordVisible ? Icons.visibility : Icons.visibility_off))
                                    ),
                                    obscuringCharacter: "⁕",
                                    obscureText: passwordVisible,
                                    textInputAction: TextInputAction.done,
                                    keyboardType: TextInputType.text,
                                    validator: (value)
                                    {
                                        if (value == null || value.isEmpty)
                                        {
                                            return 'Please enter your password';
                                        }
                                        if (value.length < 6)
                                        {
                                            return 'Password must be at least 6 characters long';
                                        }
                                        return null;
                                    }
                                ),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                        TextButton(
                                            onPressed: ()
                                            {
                                            },
                                            style: TextButton.styleFrom(
                                                foregroundColor: Colors.indigoAccent
                                            ),
                                            child: Text("Forgot Password?")

                                        )
                                    ]
                                ),

                                SizedBox(height: 12),
                                SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        onPressed: ()
                                        {
                                            if (formKey.currentState!.validate())
                                            {

                                            }
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.indigoAccent,
                                            foregroundColor: Colors.white,
                                            padding: EdgeInsets.all(12),
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(Radius.circular(12))
                                            )
                                        ),
                                        child: Text("Login", style: TextStyle(fontSize: 18))
                                    )
                                ),
                                TextButton(
                                    onPressed: ()
                                    {
                                    },
                                    style: TextButton.styleFrom(
                                        foregroundColor: Colors.indigoAccent
                                    ),
                                    child: Text("Don't have an account? Register")
                                )

                            ]
                        )
                    ]
                )
            )
        );
    }
}
