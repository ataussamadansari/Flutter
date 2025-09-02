import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddUser extends StatefulWidget
{
    const AddUser({super.key});

    @override
    State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser>
{

    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    TextEditingController name = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController phone = TextEditingController();
    bool isSaving = false;

    final dbReference = FirebaseFirestore.instance.collection('users');

    @override
  void dispose() {
    name.dispose();
    email.dispose();
    phone.dispose();
    super.dispose();
  }

    Future<void> saveUser() async
    {
        if (formKey.currentState!.validate()) 
        {
            setState(() => isSaving = true);

            // Show loading snackbar
            ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Row(
                        children: const[
                            SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                    color: Colors.white,
                                    strokeWidth: 2
                                )
                            ),
                            SizedBox(width: 15),
                            Text("Saving user...")
                        ]
                    )
                )
            );

            try
            {
                final docRef = dbReference.doc();
                await docRef.set(
                {
                    'id': docRef.id,
                    'name': name.text,
                    'email': email.text,
                    'phone': phone.text
                }
                );

                // hide loading snackbar
                ScaffoldMessenger.of(context).hideCurrentSnackBar();

                // success snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text("✅ User saved successfully!"),
                        backgroundColor: Colors.green,
                        duration: Duration(seconds: 2)
                    )
                );

                Navigator.pop(context);
            }
            catch (e)
            {
                // hide loading snackbar
                ScaffoldMessenger.of(context).hideCurrentSnackBar();

                // error snackbar
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                        content: Text("❌ Error: $e"),
                        backgroundColor: Colors.red,
                        duration: const Duration(seconds: 3)
                    )
                );
            }
            finally
            {
                setState(() => isSaving = false);
            }
        }
    }

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text('Add User'),
                centerTitle: true
            ),
            body: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Form(
                    key: formKey,
                    child: Column(
                        spacing: 15,
                        children: [
                            TextFormField(
                                controller: name,
                                decoration: InputDecoration(
                                    hintText: 'John Doe',
                                    labelText: 'Name',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12)
                                    )
                                ),
                                validator: (value)
                                {
                                    if (value!.isEmpty || value == null)
                                    {
                                        return 'Please enter a name';
                                    }
                                    return null;
                                }
                            ),
                            TextFormField(
                                controller: email,
                                decoration: InputDecoration(
                                    hintText: 'example@gmail.com',
                                    labelText: 'Email',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12)
                                    )
                                ),
                                validator: (value)
                                {
                                    if (value!.isEmpty || value == null)
                                    {
                                        return 'Please enter an email';
                                    }
                                    return null;
                                }
                            ),
                            TextFormField(
                                controller: phone,
                                decoration: InputDecoration(
                                    hintText: '9876543219',
                                    labelText: 'Phone Number',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12)
                                    )
                                ),
                                validator: (value)
                                {
                                    if (value!.isEmpty || value == null)
                                    {
                                        return 'Please enter a phone number';
                                    }
                                    if (value.length != 10)
                                    {
                                        return 'Please enter a valid phone number';
                                    }
                                    return null;
                                }
                            ),
                            SizedBox(
                                width: double.infinity,
                                height: 50,
                                child: ElevatedButton(
                                    onPressed: isSaving ? null : saveUser,
                                    child: isSaving
                                        ? const SizedBox(
                                            width: 20,
                                            height: 20,
                                            child: CircularProgressIndicator(color: Colors.white)
                                        )
                                        : const Text("Save User")
                                )
                            )
                        ]
                    )
                )
            )
        );
    }
}
