import 'package:flutter/material.dart';
import 'package:firebase_login/models/quote_model.dart';
import 'package:firebase_login/providers/quote_provider.dart';

import '../../screens/quote/update_quote.dart';

class UserQuoteItem extends StatelessWidget {
  final QuoteModel quote;
  final QuoteProvider provider;

  const UserQuoteItem({
    super.key,
    required this.quote,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UpdateQuoteScreen(quote: quote),
          ),
        );
      },
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(quote.quote ?? '',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("By: ${quote.author ?? 'Unknown'}",
                      style: const TextStyle(fontSize: 13, color: Colors.grey)),
                  Text(quote.formattedCreatedDateTime,
                      style: const TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: quote.isPublic! ? Colors.green : Colors.grey,
                    ),
                  ),
                  Spacer(),
                  IconButton(
                    icon: Icon(
                      quote.isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: quote.isFavorite ? Colors.red : null,
                    ),
                    onPressed: () {
                      provider.toggleFavorite(quote.id!, !quote.isFavorite);
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.grey),
                    onPressed: () {
                      provider.deleteQuote(quote.id!);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
