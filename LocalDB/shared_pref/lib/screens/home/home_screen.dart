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

    // Save all
    Future<void> _saveData() async
    {
        if (_nameController.text.isNotEmpty) 
        {
            await SharedPrefHelper.saveData("name", _nameController.text);
        }
        if (_ageController.text.isNotEmpty) 
        {
            await SharedPrefHelper.saveData("age", int.parse(_ageController.text));
        }

        await SharedPrefHelper.saveData("isDark", isDarkMode);
        await SharedPrefHelper.saveData("fruits", savedFruits);

        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Data saved successfully'), backgroundColor: Colors.green)
        );
    }

    // Load all
    Future<void> _loadData() async
    {
        savedName = await SharedPrefHelper.getData('name');
        savedAge = await SharedPrefHelper.getData('age');
        isDarkMode = await SharedPrefHelper.getData('isDark') ?? false;
        savedFruits = await SharedPrefHelper.getData("fruits");
        setState(()
            {
            }
        );
    }

    // clear all
    Future<void> _clearAll() async
    {
        await SharedPrefHelper.clearAll();
        setState(()
            {
                savedName = null;
                savedAge = null;
                isDarkMode = false;
                savedFruits = [];
            }
        );
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Data cleared successfully'), backgroundColor: Colors.red)
        );
    }

    // Add fruit
    void _addFruit() {
      if (_fruitController.text.isNotEmpty) {
        savedFruits.add(_fruitController.text);
        _fruitController.clear();
        setState(() {});
      }
    }

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: const Text("Shared Preferences"),
                centerTitle: true
            ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// String
                TextField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: "Enter Name (String)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),

                /// Int
                TextField(
                  controller: _ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Enter Age (Int)",
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),

                /// Bool
                Row(
                  children: [
                    const Text("Dark Mode: "),
                    Switch(
                      value: isDarkMode,
                      onChanged: (val) {
                        setState(() {
                          isDarkMode = val;
                        });
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 10),

                /// List<String>
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _fruitController,
                        decoration: const InputDecoration(
                          labelText: "Add Fruit (List<String>)",
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: _addFruit,
                    ),
                  ],
                ),
                Wrap(
                  children: savedFruits
                      .map((e) => Chip(label: Text(e)))
                      .toList(),
                ),

                const SizedBox(height: 20),

                /// Buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(onPressed: _saveData, child: const Text("Save")),
                    ElevatedButton(onPressed: _loadData, child: const Text("Load")),
                    ElevatedButton(
                        onPressed: _clearAll, child: const Text("Clear All")),
                  ],
                ),

                const SizedBox(height: 20),

                /// Display Loaded Data
                Text("🔹 Loaded Data:",
                    style: Theme.of(context).textTheme.titleLarge),
                Text("Name: ${savedName ?? "-"}"),
                Text("Age: ${savedAge ?? "-"}"),
                Text("Dark Mode: $isDarkMode"),
                Text("Fruits: ${savedFruits.isEmpty ? "-" : savedFruits.join(", ")}"),
              ],
            ),
          ),
           /* body: Padding(
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
            )*/
        );
    }
}
