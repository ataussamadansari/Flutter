import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_login/models/quote/quote_model.dart';
import 'package:flutter/material.dart';

class QuoteProvider with ChangeNotifier
{
    final _db = FirebaseFirestore.instance.collection("quotes");

    List<QuoteModel> _quotes = [];
    List<QuoteModel> get quotes => _quotes;

    /// 🔹 CREATE (Add Quote)
    Future<void> addQuote(QuoteModel quote) async
    {
        await _db.doc(quote.id).set(quote.toMap());
        _quotes.add(quote);
        notifyListeners();
    }

    /// 🔹 READ (Fetch All Quotes - Public only or user wise)
    Future<void> fetchQuotes({bool onlyPublic = true, String? userId}) async
    {
        Query query = _db.orderBy("createdAt", descending: true);

        if (onlyPublic)
        {
            query = query.where("isPublic", isEqualTo: true);
        }

        if (userId != null)
        {
            query = query.where("userId", isEqualTo: userId);
        }

        final snapshot = await query.get();

        _quotes = snapshot.docs
            .map((doc) => QuoteModel.fromMap(doc.data() as Map<String, dynamic>))
            .toList();

        notifyListeners();
    }

    /// 🔹 UPDATE (Edit Quote)
    Future<void> updateQuote(QuoteModel quote) async
    {
        await _db.doc(quote.id).update(quote.toMap());

        // Local list update
        final index = _quotes.indexWhere((q) => q.id == quote.id);

        if (index != -1)
        {
            _quotes[index] = quote;
            notifyListeners();
        }
    }

    /// 🔹 DELETE (Remove Quote)
    Future<void> deleteQuote(String id) async
    {
        await _db.doc(id).delete();

        _quotes.removeWhere((q) => q.id == id);
        notifyListeners();
    }

    /// 🔹 REALTIME STREAM (for live updates UI me)
    Stream<List<QuoteModel>> streamQuotes({bool onlyPublic = true}) {
      Query query = _db.orderBy("createdAt", descending: true);

      if (onlyPublic) {
        query = query.where("isPublic", isEqualTo: true);
      }

      return query.snapshots().map(
          (snapshot) {
            return snapshot.docs
                .map((doc) => QuoteModel.fromMap(doc.data() as Map<String, dynamic>))
                .toList();
          }
      );
    }
}
