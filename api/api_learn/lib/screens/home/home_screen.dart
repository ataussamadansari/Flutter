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
    String result = '';
    int statusCode = -1;

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
            final response = await http.get(Uri.parse('$url/10'));
            result = response.body;
            statusCode = response.statusCode;
        }
        catch(e)
        {
            print('Error: $e');
            result = e.toString();
        }
        finally
        {
            setState(()
                {
                    loading = false;
                }
            );
        }
    }

    void postMethod() async
    {
        setState(()
            {
                loading = true;
            }
        );
        try
        {
            final response = await http.post(
                Uri.parse(url),
                body: jsonEncode(
                {
                    'title': 'This is new post',
                    'body': 'Here is the new post body',
                    'userId': 100
                }
                ),
                headers: 
                {
                    'Content-Type': 'application/json; charset=UTF-8'
                }
            );
            result = response.body;
            statusCode = response.statusCode;
        }
        catch (e)
        {
            result = e.toString();
        }
        finally
        {
            setState(()
                {
                    loading = false;
                }
            );
        }
    }

    void putMethod() async
    {
        setState(()
            {
                loading = true;
            }
        );
        try
        {
            final response = await http.put(
                Uri.parse('$url/1'),
                body: jsonEncode(
                {
                    'id': 1,
                    'title': 'New Title',
                    'body': 'New Body',
                    'userId': 1
                }
                ),
                headers: 
                {
                    'Content-Type': 'application/json; charset=UTF-8'
                }
            );
            result = response.body;
            statusCode = response.statusCode;
        }
        catch (e)
        {
            result = e.toString();
        }
        finally
        {
            setState(()
                {
                    loading = false;
                }
            );
        }
    }

    void patchMethod() async
    {
        setState(()
            {
                loading = true;
            }
        );
        try
        {
          final response = await http.patch(
            Uri.parse('$url/100'),
            body: jsonEncode({
              'title': 'New Title by Patch'
            }),
            headers: {
              'Content-Type': 'application/json; charset=UTF-8'
            }
          );
          result = response.body;
          statusCode = 200;
        }
        catch (e)
        {
            result = e.toString();
        }
        finally
        {
            setState(()
                {
                    loading = false;
                }
            );
        }
    }

    void deleteMethod() async
    {
        setState(()
            {
                loading = true;
            }
        );
        try
        {
          final response = await http.delete(
            Uri.parse('$url/10'),
          );

          result = response.body;
          statusCode = response.statusCode;
        }
        catch (e)
        {
            result = e.toString();
        }
        finally
        {
            setState(()
                {
                    loading = false;
                }
            );
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
                child: Column(
                    spacing: 8,
                    children: [
                        SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ListView(
                                padding: EdgeInsets.all(4),
                                scrollDirection: Axis.horizontal,
                                children: [
                                    ElevatedButton(
                                        onPressed: ()
                                        {
                                            getData();
                                        },
                                        child: Text('GET')
                                    ),
                                    SizedBox(width: 8),
                                    ElevatedButton(
                                        onPressed: ()
                                        {
                                            postMethod();
                                        },
                                        child: Text('POST')
                                    ),
                                    SizedBox(width: 8),
                                    ElevatedButton(
                                        onPressed: ()
                                        {
                                            putMethod();
                                        },
                                        child: Text('PUT')
                                    ),
                                    SizedBox(width: 8),
                                    ElevatedButton(
                                        onPressed: ()
                                        {
                                            patchMethod();
                                        },
                                        child: Text('PATCH')
                                    ),
                                    SizedBox(width: 8),
                                    ElevatedButton(
                                        onPressed: ()
                                        {
                                            deleteMethod();
                                        },
                                        child: Text('DELETE')
                                    )

                                ]
                            )
                        ),

                        ListTile(
                            title: Text('Response'),
                            subtitle: Text(result),
                            trailing: loading ? CircularProgressIndicator() : Text('StatusCode: $statusCode')
                        )
                    ]
                )
            )
        );
    }
}
