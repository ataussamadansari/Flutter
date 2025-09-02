import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_intro/screens/update_user/update_user.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
    final dbRef = FirebaseFirestore.instance.collection('users');

    List<Map<String, dynamic>> users = [];

    void fetchDate() async
    {
        users.clear();
        final data = await dbRef.get();
        setState(()
            {
                for (var doc in data.docs)
                {
                    users.add(doc.data());
                }
            }
        );
    }

    @override
    void initState()
    {
        fetchDate();
        super.initState();
    }

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text('Firebase Intro'),
                centerTitle: true
            ),
            body: StreamBuilder(
                stream: dbRef.snapshots(),
                builder: (context, snapshot)
                {
                    if (snapshot.connectionState == ConnectionState.waiting)
                    {
                        return const Center(child: CircularProgressIndicator());
                    }

                    if (!snapshot.hasData || snapshot.data!.docs.isEmpty)
                    {
                        return const Center(child: Text("No users found"));
                    }

                    final users = snapshot.data!.docs;

                    return ListView(
                        children: [
                            for (var user in users)
                                ListTile(
                                    onTap: () {
                                        Navigator.push(context, MaterialPageRoute(
                                            builder: (context) => UpdateUser(user: user)
                                        )
                                        );
                                    },
                                    leading: Icon(CupertinoIcons.person_solid),
                                    title: Text(user['name'], style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
                                    subtitle: Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                            Row(
                                                spacing: 4,
                                                children: [
                                                    Icon(CupertinoIcons.phone_solid, size: 14),
                                                    Text(user['phone'])
                                                ]
                                            ),
                                            Row(
                                                spacing: 4,
                                                children: [
                                                    Icon(CupertinoIcons.mail_solid, size: 14),
                                                    Text(user['email'])
                                                ]
                                            )
                                        ]
                                    ),
                                    trailing: IconButton(onPressed: ()
                                        {
                                            dbRef.doc(user['id']).delete();
                                        }, icon: Icon(CupertinoIcons.delete))
                                )
                        ]
                    );
                }
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: ()
                {
                    Navigator.pushNamed(context, '/add-user');
                },
                child: Icon(Icons.add)
            )
        );
    }
}
