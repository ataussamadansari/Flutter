import 'package:cloud_firestore/cloud_firestore.dart';

class QuoteModel
{

    final String id;
    final String quote;
    final String author;
    final String userId;
    final bool isPublic;
    final DateTime createdAt;

    QuoteModel({
        required this.id,
        required this.quote,
        required this.author,
        required this.userId,
        required this.isPublic,
        required this.createdAt
    });

    Map<String, dynamic> toMap() {
      return {
        "id" : id,
        "quote" : quote,
        "author" : author,
        "userId" : userId,
        "isPublic" : isPublic,
        "createdAt" : createdAt
      };
    }

    factory QuoteModel.fromMap(Map<String, dynamic> map) {
      return QuoteModel(
        id: map["id"],
        quote: map["quote"],
        author: map["author"],
        userId: map["userId"],
        isPublic: map["isPublic"] ?? false,
        createdAt: (map["createdAt"] as Timestamp).toDate(),
      );
    }

}
