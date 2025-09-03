import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/quote_model.dart';
import '../../providers/auth_provider.dart';
import '../../providers/quote_provider.dart';

class AddQuoteScreen extends StatefulWidget {
  const AddQuoteScreen({super.key});

  @override
  State<AddQuoteScreen> createState() => _AddQuoteScreen();
}

class _AddQuoteScreen extends State<AddQuoteScreen> {
  final _formKey = GlobalKey<FormState>();
  final _quoteController = TextEditingController();
  TextEditingController _authorController = TextEditingController();
  bool _visibility = false;


  @override
  Widget build(BuildContext context) {
    final quoteProvider = Provider.of<QuoteProvider>(context);
    final authProvider = Provider.of<AuthProvider>(context);
    final user = authProvider.user;

    if (user != null) {
      _authorController.text = user.name!;
    }

    return Scaffold(
      appBar: AppBar(title: Text('Add New Quote')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _quoteController,
                decoration: InputDecoration(
                  labelText: 'Quote',
                  alignLabelWithHint: true,
                  border: OutlineInputBorder(),
                ),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a quote';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _authorController,
                decoration: InputDecoration(
                  labelText: 'Author',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter author name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              DropdownButtonFormField<bool>(
                value: _visibility,
                items: [
                  DropdownMenuItem(value: true, child: Text('Public')),
                  DropdownMenuItem(value: false, child: Text('Private')),
                ],
                onChanged: (value) {
                  setState(() {
                    _visibility = value!;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Visibility',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 24),
              quoteProvider.isLoading
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final newQuote = QuoteModel(
                      quote: _quoteController.text,
                      author: _authorController.text,
                      userId: user?.uid,
                      isPublic: _visibility,
                    );

                    final success = await quoteProvider.addQuote(newQuote);

                    if (success) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Quote added successfully'), backgroundColor: Colors.green),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Failed to add quote'), backgroundColor: Colors.red),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white
                ),
                child: Text('Add Quote', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
