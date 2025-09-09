import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sqlite_db/db/db_helper.dart';

class HomeScreen extends StatefulWidget
{
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
    bool isSearching  = false;
    TextEditingController title = TextEditingController();
    TextEditingController content = TextEditingController();
    TextEditingController search = TextEditingController();

    List<Map<String, dynamic>> notes = [];
    List<Map<String, dynamic>> filterNotes = [];

    @override
    void initState() 
    {
        super.initState();
        fetchNotes();
    }

    void fetchNotes() async
    {
        final data = await DBHelper.getData();
        setState(()
            {
                notes = data;
            }
        );
    }

    void saveNote() async
    {
        await DBHelper.insertData(title.text.trim(), content.text.trim());
        title.clear();
        content.clear();
        fetchNotes();
    }

    void updateNote(int id, String oldTitle, String oldContent, BuildContext context) {
        final title = TextEditingController(text: oldTitle);
        final content = TextEditingController(text: oldContent);

        showCupertinoDialog(
            context: context,
            builder: (ctx) => CupertinoAlertDialog(
                title: Text("Update Note"),
                content: SizedBox(
                    height: 120,
                  child: Column(
                      spacing: 10,
                      children: [
                          CupertinoTextField(
                              controller: title,
                              placeholder: "Title",
                          ),
                          CupertinoTextField(
                              controller: content,
                              placeholder: "Content",
                              maxLines: 3,
                          ),
                      ],
                  ),
                ),
                actions: [
                    CupertinoDialogAction(
                        onPressed: () => Navigator.pop(ctx),
                        isDestructiveAction: true,
                        child: Text("Cancel"),
                    ),
                    CupertinoDialogAction(
                        onPressed: () async {
                            await DBHelper.updateData(
                                id,
                                title.text.trim(),
                                content.text.trim(),
                            );
                            Navigator.pop(ctx);
                            fetchNotes();
                            title.clear();
                            content.clear();
                        },
                        isDefaultAction: true,
                        child: Text("Update"),
                    ),
                ],
            ),
        );
    }

    void deleteNote(int id) async
    {
        await DBHelper.deleteData(id);
        fetchNotes();
    }

    void searchNotes(String query) {
        final results = notes.where((note) {
            final title = note['title'].toString().toLowerCase();
            final content = note['content'].toString().toLowerCase();
            return title.contains(query) || content.contains(query);
        }).toList();

        setState(() {
          filterNotes = results;
        });
    }

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(
                title: !isSearching ? Text('Local DB') : TextField(
                    controller: search,
                    autofocus: true,
                    decoration: InputDecoration(
                        hintText: 'Search here...',
                        border: InputBorder.none
                    ),
                    onChanged: searchNotes,
                ),
                actions: [
                    IconButton(onPressed: () {setState(() {
                      if(isSearching) {
                          search.clear();
                          filterNotes = notes;
                      }
                      isSearching = !isSearching;
                    });}, icon: Icon(isSearching? Icons.close : Icons.search))
                ],
            ),
            body: Column(
                spacing: 12,
                children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                          controller: title,
                          decoration: InputDecoration(
                              labelText: "Title"
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: TextField(
                          controller: content,
                          decoration: InputDecoration(
                              labelText: "Content"
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: SizedBox(
                          width: double.infinity,
                          height: 48,
                          child: ElevatedButton(
                              onPressed: () => saveNote(),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12)
                                  )
                              ),
                              child: Text(
                                  'Save Note',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                  )
                              ),
                          )
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                            itemCount: isSearching ? filterNotes.length : notes.length,
                            itemBuilder: (context, index)
                            {
                                final note = isSearching ? filterNotes[index] : notes[index];
                                return ListTile(
                                    onTap: () {
                                        updateNote(note['id'], note['title'], note['content'], context);
                                    },
                                    title: Text(note['title']),
                                    subtitle: Text(note['content']),
                                    trailing: IconButton(onPressed: () => deleteNote(note['id']), icon: Icon(CupertinoIcons.delete))
                                );
                            }
                        )
                    )
                ]
            )
        );
    }
}
