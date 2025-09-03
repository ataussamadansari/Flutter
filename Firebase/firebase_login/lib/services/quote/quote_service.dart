import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login/models/quote_model.dart';

class QuoteService
{
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;

    // Create a new quote
    Future<QuoteModel?> createQuote(QuoteModel quote) async
    {
      try {
        final docRef = _firestore.collection('quotes').doc();
        final newQuote = quote.copyWith(id: docRef.id, createdAt: Timestamp.now());

        await docRef.set(newQuote.toMap());
        return newQuote;
      } catch (e) {
        print('Error creating quote: $e');
        return null;
      }
    }

    // Get all quotes for a user
    Stream<List<QuoteModel>> getUserQuotes(String userId) {
      return _firestore
          .collection('quotes')
          .where('userId', isEqualTo: userId)
          .orderBy('createdAt', descending: true)
          .snapshots()
          .map((snapshot) => snapshot.docs
            .map((doc) => QuoteModel.fromMap(doc.data()))
            .toList());
    }

    // Get all public quotes
    Stream<List<QuoteModel>> getPublicQuotes() {
      return _firestore
          .collection('quotes')
          .where('isPublic', isEqualTo: true)
          .orderBy('createdAt', descending: true)
          .snapshots()
          .map((snapshot) => snapshot.docs
          .map((doc) => QuoteModel.fromMap(doc.data()))
          .toList());
    }

    // Update a quote
    Future<bool> updateQuote(QuoteModel quote) async {
      try {
        await _firestore.collection('quotes')
            .doc(quote.id)
            .update(quote.toMap());
        return true;
      } catch (e) {
        print('Error updating quote: $e');
        return false;
      }
    }

    // Delete a quote
    Future<bool> deleteQuote(String quoteId) async {
      try {
        await _firestore.collection('quotes').doc(quoteId).delete();
        return true;
      } catch (e) {
        print('Error deleting quote: $e');
        return false;
      }
    }

    // Favorite a quote
    Future<bool> toggleFavorite(String quoteId, bool isFavorite) async {
      try {
        await _firestore
            .collection('quotes')
            .doc(quoteId)
            .update({'isFavorite': isFavorite});
        return true;
      } catch (e) {
        print('Error toggling favorite: $e');
        return false;
      }
    }
}
