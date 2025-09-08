import 'package:flutter/material.dart';
import 'package:shared_pref/utils/shared_pref_helper.dart';

class HomeScreen extends StatefulWidget
{
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
    final TextEditingController _nameController = TextEditingController();
    final TextEditingController _ageController = TextEditingController();
    final TextEditingController _fruitController = TextEditingController();

    String? savedName;
    int? savedAge;
    bool isDarkMode = false;
    List<String> savedFruits = [];

    // Save data
    Future<void> _saveName() async
    {
        if (_nameController.text.isNotEmpty)
        {
            await SharedPrefHelper.saveData('userName', _nameController.text);
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text('Name saved successfully'),
                    backgroundColor: Colors.green
                )
            );
        }
    }

    // Load data
    Future<void> _loadName() async
    {
        var name = await SharedPrefHelper.getData('userName');
        setState(()
            {
                savedName = name;
            }
        );
    }

    // Remove data
    Future<void> _removeName() async
    {
        await SharedPrefHelper.removeData('userName');
        setState(()
            {
                savedName = null;
            }
        );
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Name removed successfully'),
              backgroundColor: Colors.orange
            )
        );
    }

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(
                title: Text(savedName == null
                        ? "Shared Preferences"
                        : "Welcome, $savedName"),
                centerTitle: true
            ),
            body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    children: [
                        TextField(
                            controller: _nameController,
                            decoration: const InputDecoration(
                                labelText: "Enter Name",
                                border: OutlineInputBorder()
                            )
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: _saveName,
                            child: const Text("Save Name")
                        ),
                        ElevatedButton(
                            onPressed: _loadName,
                            child: const Text("Load Name")
                        ),
                        ElevatedButton(
                            onPressed: _removeName,
                            child: const Text("Remove Name")
                        )
                    ]
                )
            )
        );
    }
}
