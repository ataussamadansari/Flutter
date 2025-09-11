import 'package:api_with_getx/app/data/models/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserCard extends StatelessWidget
{
    final UserModel user;
    final VoidCallback onTap;
    final VoidCallback onLongPress;
    final VoidCallback onDelete;

    const UserCard({super.key, 
        required this.user, 
        required this.onTap,
        required this.onLongPress,
        required this.onDelete
    });

    @override
    Widget build(BuildContext context)
    {
        return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            elevation: 2,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
                leading: CircleAvatar(
                    backgroundColor: Colors.yellow[200],
                    child: Text(
                        user.name!.isNotEmpty ? user.name![0].toUpperCase() : "?",
                        style: TextStyle(fontWeight: FontWeight.bold)
                    )
                ),
                title: Text(
                    user.name.toString(),
                    style: TextStyle(fontWeight: FontWeight.w500)
                ),
                subtitle: Text(user.email.toString()),
                trailing: IconButton(onPressed: onDelete, icon: Icon(CupertinoIcons.delete, color: Colors.red)),
                onTap: onTap,
                onLongPress: onLongPress
            )
        );
    }
}

class UserDetailsSheet extends StatelessWidget
{
    final UserModel user;
    const UserDetailsSheet({super.key, required this.user});

    @override
    Widget build(BuildContext context)
    {
        return Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Container(
                        width: 40,
                        height: 4,
                        margin: const EdgeInsets.only(bottom: 16),
                        decoration: BoxDecoration(
                            color: Colors.green[300],
                            borderRadius: BorderRadius.circular(2)
                        )
                    ),

                    // close button
                    Align(
                        alignment: AlignmentGeometry.bottomRight,
                        child: IconButton(
                            onPressed: () => Navigator.pop(context),
                            style: TextButton.styleFrom(
                                foregroundColor: Colors.black26
                            ),
                            icon: Icon(Icons.close)
                        )
                    ),

                    CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.brown[100],
                        child: Text(user.name!.isNotEmpty ? user.name![0].toUpperCase() : "?",
                            style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold))
                    ),

                    Text('Name: ${user.name}', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('UserName: ${user.username}'),
                    Text("Email: ${user.email}"),
                    Text('Phone: ${user.phone}'),
                    SizedBox(height: 12),
                    SizedBox(
                        width: double.infinity,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            spacing: 8,
                            children: [
                                Expanded(
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                            Text("Address:", style: TextStyle(fontWeight: FontWeight.bold)),
                                            Divider(),
                                            Text("${user.address!.street}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                                            Text("${user.address!.suite}"),
                                            Text("${user.address!.city}"),
                                            Text("${user.address!.zipcode}")
                                        ]
                                    )
                                ),
                                Expanded(
                                    child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                            Text("Company:", style: TextStyle(fontWeight: FontWeight.bold)),
                                            Divider(),
                                            Text("${user.company!.name}", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                                            Text("${user.company!.catchPhrase}"),
                                            Text("${user.company!.bs}")
                                        ]
                                    )
                                )
                            ]
                        )
                    ),
                    SizedBox(height: 16)
                ]
            )
        );
    }
}


