import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../providers/auth_provider.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget
{
    @override
    _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen>
{
    final _formKey = GlobalKey<FormState>();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();

    @override
    Widget build(BuildContext context)
    {
        final authProvider = Provider.of<AuthProvider>(context);

        return Scaffold(
            body: Form(
                key: _formKey,
                child: ListView(
                    padding: EdgeInsets.all(12.0),
                    children: [
                        SizedBox(height: 20),
                        SvgPicture.asset('assets/svgs/login.svg', width: 300),
                        // 👇 Title
                        Text(
                            "Welcome Back 👋",
                            style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold
                            )
                        ),
                        // 👇 Description
                        Text(
                            "Please sign in to continue your journey.",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600]
                            )
                        ),

                        SizedBox(height: 20),
                        TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                                labelText: 'Email',
                                border: OutlineInputBorder()
                            ),
                            validator: (value)
                            {
                                if (value == null || value.isEmpty)
                                {
                                    return 'Please enter email';
                                }
                                if (!value.contains('@'))
                                {
                                    return 'Please enter a valid email';
                                }
                                return null;
                            }
                        ),
                        SizedBox(height: 16),
                        TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder()
                            ),
                            obscureText: true,
                            validator: (value)
                            {
                                if (value == null || value.isEmpty)
                                {
                                    return 'Please enter password';
                                }
                                if (value.length < 6)
                                {
                                    return 'Password must be at least 6 characters';
                                }
                                return null;
                            }
                        ),
                        SizedBox(height: 24),
                        authProvider.isLoading ? Center(child: CircularProgressIndicator()) : ElevatedButton(
                                onPressed: () async
                                {
                                    if (_formKey.currentState!.validate())
                                    {
                                        bool success = await authProvider.login(
                                            _emailController.text,
                                            _passwordController.text
                                        );

                                        if (!success)
                                        {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text('Login failed. Please try again.'))
                                            );
                                        }
                                    }
                                },
                                style: ElevatedButton.styleFrom(
                                    minimumSize: Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                                    foregroundColor: Colors.green
                                ),
                                child: Text('Login', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w800))
                            )
                    ]
                )
            ),
            bottomNavigationBar: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                    onPressed: ()
                    {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => RegisterScreen())
                        );
                    },
                    style: TextButton.styleFrom(
                        overlayColor: Colors.transparent,
                        foregroundColor: Colors.green
                    ),
                    child: Text('Don\'t have an account? Register')
                )
            )
        );
    }

    @override
    void dispose()
    {
        _emailController.dispose();
        _passwordController.dispose();
        super.dispose();
    }
}
