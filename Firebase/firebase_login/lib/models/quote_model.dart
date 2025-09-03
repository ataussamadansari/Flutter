import 'package:cloud_firestore/cloud_firestore.dart';
import '../utils/date_formate/date_time_formatter.dart';

class QuoteModel
{
    final String? id;
    final String? quote;
    final String? author;
    final String? userId;
    final bool? isPublic;
    final bool isFavorite;
    final Timestamp? createdAt;

    QuoteModel({
        this.id,
        this.quote,
        this.author,
        this.userId,
        this.isPublic = false,
        this.isFavorite = false,
        this.createdAt,
    });

    // CopyWith method for immutability
    QuoteModel copyWith({
        String? id,
        String? quote,
        String? author,
        String? userId,
        bool? isPublic,
        bool? isFavorite,
        Timestamp? createdAt
    }) {
      return QuoteModel(
        id: id ?? this.id,
        quote: quote ?? this.quote,
        author: author ?? this.author,
        userId: userId ?? this.userId,
        isPublic: isPublic ?? this.isPublic,
        isFavorite: isFavorite ?? this.isFavorite,
        createdAt: createdAt ?? this.createdAt
      );
    }

    factory QuoteModel.fromMap(Map<String, dynamic> data)
    {
        return QuoteModel(
            id: data['id'],
            quote: data['quote'],
            author: data['author'],
            userId: data['userId'],
            // isPublic: data['isPublic'] ?? false,
            isPublic: (data['isPublic'] ?? false) as bool,     // 👈 safe cast
            // isFavorite: data['isFavorite'] ?? false,
            isFavorite: (data['isFavorite'] ?? false) as bool, // 👈 safe cast
            createdAt: data['createdAt']
        );
    }

    Map<String, dynamic> toMap()
    {
        return
        {
            'id': id,
            'quote': quote,
            'author': author,
            'userId': userId,
            'isPublic': isPublic,
            'isFavorite': isFavorite,
            'createdAt': createdAt
        };
    }

    String get formattedDate =>
    DateTimeFormatter.formatDate(createdAt);

    String get formattedTime =>
    DateTimeFormatter.formatTimeOnly(createdAt);

    String get formattedCreatedDateTime =>
        DateTimeFormatter.formatDateTime(createdAt, prefix: 'Posted: ');

}
