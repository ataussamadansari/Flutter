import 'dart:convert';

import 'package:api_learn/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget
{
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
    bool loading = false;
    String url = "https://jsonplaceholder.typicode.com/posts";
    List<PostModel> posts = [];

    void getData() async
    {
        posts.clear();
        setState(()
            {
                loading = true;
            }
        );
        try
        {
            final response = await http.get(Uri.parse(url));
            final data = jsonDecode(response.body);
            for(var post in data) {
                PostModel newPost = PostModel.fromJson(post);
                posts.add(newPost);
            }
        }
        catch(e)
        {
            print('Error: $e');
        }
        finally
        {
            setState(() {
                loading = false;
            });
        }
    }

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text('Api Integration'),
                centerTitle: true
            ),
            body: Center(
                child: loading ? CircularProgressIndicator() : Column(
                        children: [
                            ElevatedButton(onPressed: ()
                                {
                                    getData();
                                },
                                child: Text('Get Method')
                            ),
                            Expanded(
                                child: ListView(
                                    children: [
                                        for (var post in posts)
                                            ListTile(
                                                title: Text(post.title, style: TextStyle(color: Colors.green),),
                                                subtitle: Text(post.body),
                                                leading: Text(post.id.toString()),
                                            ),
                                    ],
                                )
                            )
                        ]
                    )
            )
        );
    }
}
