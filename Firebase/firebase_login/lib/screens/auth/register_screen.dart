import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth/auth_provider.dart';
import '../home/home_screen.dart';

class RegisterScreen extends StatefulWidget
{
    const RegisterScreen({super.key});

    @override
    State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen>
{
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    bool obscure = true;

    void _register(AuthProvider auth) async
    {
        if (!formKey.currentState!.validate()) return;

        await auth.register(
            nameController.text.trim(),
            emailController.text.trim(),
            passwordController.text.trim()
        );

        if (auth.errorMsg != null) 
        {
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(auth.errorMsg!), backgroundColor: Colors.red)
            );
        }

        if (auth.appUser != null) 
        {
            Navigator.pop(context);
        }
    }

    @override
    Widget build(BuildContext context) 
    {
        return Consumer<AuthProvider>(
            builder: (context, auth, _) => Scaffold(
                backgroundColor: Colors.green.shade50,
                body: Center(
                    child: SingleChildScrollView(
                        padding: const EdgeInsets.all(20),
                        child: Card(
                            elevation: 6,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16)),
                            child: Padding(
                                padding: const EdgeInsets.all(20),
                                child: Form(
                                    key: formKey,
                                    child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                            Text("Create Account 🚀",
                                                style: TextStyle(
                                                    fontSize: 24, fontWeight: FontWeight.bold)),
                                            SizedBox(height: 30),

                                            // Name
                                            TextFormField(
                                                controller: nameController,
                                                decoration: InputDecoration(
                                                    labelText: "Name",
                                                    prefixIcon: Icon(Icons.person),
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(12))
                                                ),
                                                validator: (value) =>
                                                value!.isEmpty ? "Enter your name" : null
                                            ),
                                            SizedBox(height: 15),

                                            // Email
                                            TextFormField(
                                                controller: emailController,
                                                decoration: InputDecoration(
                                                    labelText: "Email",
                                                    prefixIcon: Icon(Icons.email),
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(12))
                                                ),
                                                validator: (value) =>
                                                value!.isEmpty ? "Enter your email" : null
                                            ),
                                            SizedBox(height: 15),

                                            // Password
                                            TextFormField(
                                                controller: passwordController,
                                                obscureText: obscure,
                                                decoration: InputDecoration(
                                                    labelText: "Password",
                                                    prefixIcon: Icon(Icons.lock),
                                                    suffixIcon: IconButton(
                                                        icon: Icon(
                                                            obscure ? Icons.visibility : Icons.visibility_off),
                                                        onPressed: () =>
                                                        setState(() => obscure = !obscure)
                                                    ),
                                                    border: OutlineInputBorder(
                                                        borderRadius: BorderRadius.circular(12))
                                                ),
                                                validator: (value) => value!.length < 6
                                                    ? "Min 6 characters required"
                                                    : null
                                            ),
                                            SizedBox(height: 20),

                                            // Register Button
                                            SizedBox(
                                                width: double.infinity,
                                                child: ElevatedButton(
                                                    style: ElevatedButton.styleFrom(
                                                        backgroundColor: Colors.green,
                                                        padding: EdgeInsets.symmetric(vertical: 14),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(12))
                                                    ),
                                                    onPressed: auth.isLoading
                                                        ? null
                                                        : () => _register(auth),
                                                    child: auth.isLoading
                                                        ? CircularProgressIndicator(color: Colors.white)
                                                        : Text("Register", style: TextStyle(fontSize: 18, color: Colors.white))
                                                )
                                            ),

                                            TextButton(
                                                onPressed: () => Navigator.pop(context),
                                                child: Text("Already have an account? Login")
                                            )
                                        ]
                                    )
                                )
                            )
                        )
                    )
                )
            )
        );
    }
}
