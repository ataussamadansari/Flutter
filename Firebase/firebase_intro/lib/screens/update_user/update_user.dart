import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class UpdateUser extends StatefulWidget
{
    final QueryDocumentSnapshot<Map<String, dynamic>> user;
    const UpdateUser({super.key, required this.user});

    @override
    State<UpdateUser> createState() => _UpdateUserState();
}

class _UpdateUserState extends State<UpdateUser>
{
    final dbRef = FirebaseFirestore.instance.collection('users');

    late TextEditingController name;
    late TextEditingController email;
    late TextEditingController phone;

    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    @override
    void initState()
    {
        super.initState();
        final data = widget.user.data();

        name = TextEditingController(text: data['name']);
        email = TextEditingController(text: data['email']);
        phone = TextEditingController(text: data['phone']);
    }

    @override
    void dispose()
    {
        name.dispose();
        email.dispose();
        phone.dispose();
        super.dispose();
    }

    void updateUser() async
    {
        if (formKey.currentState!.validate())
        {
            await dbRef.doc(widget.user.id).update(
            {
                'name': name.text.trim(),
                'email': email.text.trim(),
                'phone': phone.text.trim()
            }
            );

            ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                    content: Text("✅ User updated successfully"),
                    backgroundColor: Colors.green
                )
            );

            Navigator.pop(context);
        }
    }

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text('Update User'),
                centerTitle: true
            ),
            body: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                    key: formKey,
                    child: ListView(
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
                                validator: (value) =>
                                value == null || value.isEmpty ? "Enter name" : null
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                                controller: email,
                                decoration: InputDecoration(
                                    hintText: 'example@mail.com',
                                    labelText: 'Email',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12)
                                    )
                                ),
                                validator: (value) =>
                                value == null || value.isEmpty ? "Enter email" : null
                            ),
                            const SizedBox(height: 12),
                            TextFormField(
                                controller: phone,
                                decoration: InputDecoration(
                                    hintText: '9876543210',
                                    labelText: 'Phone',
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(12)
                                    )
                                ),
                                validator: (value)
                                {
                                    if (value == null || value.isEmpty) 
                                    {
                                        return "Enter phone number";
                                    }
                                    if (value.length != 10) 
                                    {
                                        return "Enter a valid phone number";
                                    }
                                    return null;
                                }
                            ),
                            const SizedBox(height: 20),
                            ElevatedButton(
                                onPressed: updateUser,
                                style: ElevatedButton.styleFrom(
                                    minimumSize: const Size(double.infinity, 50),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(12)
                                    )
                                ),
                                child: const Text("Update User")
                            )
                        ]
                    )
                )
            )
        );
    }
}
