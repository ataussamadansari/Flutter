import 'package:flutter_svg/flutter_svg.dart';

import '../../models/quote_model.dart';
import '../../providers/quote_provider.dart';
import 'package:flutter/material.dart';

class PublicQuoteItem extends StatelessWidget
{
    final QuoteModel quote;
    final QuoteProvider provider;

    const PublicQuoteItem({
        super.key,
        required this.quote,
        required this.provider
    });

    @override
    Widget build(BuildContext context)
    {
        return Card(
            color: Colors.blue.shade50,
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 2,
            child: Stack(
                children: [
                    Positioned(left: 5, child: Opacity(opacity: 0.2, child: SvgPicture.asset('assets/svgs/quote.svg', width: 100))),
                    Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                                Text(quote.quote ?? '',
                                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                                const SizedBox(height: 6),
                                SizedBox(
                                    width: double.infinity,
                                    child: Text(
                                        "~ ${quote.author ?? 'Unknown'}",
                                        textAlign: TextAlign.end,
                                        style: const TextStyle(fontSize: 13, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)
                                    )
                                ),
                                Row(
                                    children: [
                                        Text(quote.formattedCreatedDateTime,
                                            style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                        const Spacer(),
                                        IconButton(
                                            icon: Icon(
                                                quote.isFavorite ? Icons.favorite : Icons.favorite_border,
                                                color: quote.isFavorite ? Colors.red : null
                                            ),
                                            onPressed: ()
                                            {
                                                provider.toggleFavorite(quote.id!, !quote.isFavorite);
                                            }
                                        )]
                                )
                            ]
                        )
                    )]
            )
        );
    }
}
