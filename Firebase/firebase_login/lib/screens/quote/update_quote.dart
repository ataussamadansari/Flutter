import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/quote_model.dart';
import '../../providers/quote_provider.dart';

class UpdateQuoteScreen extends StatefulWidget {
  final QuoteModel quote;

  const UpdateQuoteScreen({super.key, required this.quote});

  @override
  State<UpdateQuoteScreen> createState() => _UpdateQuoteScreenState();
}

class _UpdateQuoteScreenState extends State<UpdateQuoteScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _quoteController;
  late TextEditingController _authorController;
  late bool _visibility;

  @override
  void initState() {
    super.initState();
    _quoteController = TextEditingController(text: widget.quote.quote);
    _authorController = TextEditingController(text: widget.quote.author);
    _visibility = widget.quote.isPublic!;
  }

  @override
  void dispose() {
    _quoteController.dispose();
    _authorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final quoteProvider = Provider.of<QuoteProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Update Quote')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Quote field
              TextFormField(
                controller: _quoteController,
                decoration: const InputDecoration(
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
              const SizedBox(height: 16),

              // Author field
              TextFormField(
                controller: _authorController,
                decoration: const InputDecoration(
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
              const SizedBox(height: 16),

              // Visibility dropdown
              DropdownButtonFormField<bool>(
                value: _visibility,
                items: const [
                  DropdownMenuItem(value: true, child: Text('Public')),
                  DropdownMenuItem(value: false, child: Text('Private')),
                ],
                onChanged: (value) {
                  setState(() {
                    _visibility = value!;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Visibility',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),

              // Save button
              quoteProvider.isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final updatedQuote = widget.quote.copyWith(
                      quote: _quoteController.text,
                      author: _authorController.text,
                      isPublic: _visibility,
                    );

                    final success =
                    await quoteProvider.updateQuote(updatedQuote);

                    if (success) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Quote updated successfully'),
                          backgroundColor: Colors.green,
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Failed to update quote'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  }
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                ),
                child: const Text(
                  'Update Quote',
                  style: TextStyle(
                      fontSize: 18, fontWeight: FontWeight.w800),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
