import 'package:firebase_login/models/quote_model.dart';
import 'package:firebase_login/services/quote/quote_service.dart';
import 'package:flutter/material.dart';

class QuoteProvider with ChangeNotifier
{
    final QuoteService _quoteService = QuoteService();
    List<QuoteModel> _userQuotes = [];
    List<QuoteModel> _publicQuotes = [];
    bool _isLoading = false;

    List<QuoteModel> get userQuotes => _userQuotes;
    List<QuoteModel> get publicQuotes => _publicQuotes;
    bool get isLoading => _isLoading;

    // Load user quotes
    void loadUserQuotes(String userId) 
    {
        // _isLoading = true;
        // notifyListeners();

        _quoteService.getUserQuotes(userId).listen((quotes)
            {
                _userQuotes = quotes;
                // _isLoading = false;
                notifyListeners();
            }
        );
    }

    // Load public quotes
    void loadPublicQuotes() {
      // _isLoading = true;
      // notifyListeners();

      _quoteService.getPublicQuotes().listen((quotes) {
        _publicQuotes = quotes;
        // _isLoading = false;
        notifyListeners();
      });
    }

    // Add new quote
    Future<bool> addQuote(QuoteModel quote) async {
      _isLoading = true;
      notifyListeners();

      final result = await _quoteService.createQuote(quote);

      _isLoading = false;
      notifyListeners();

      return result != null;
    }

    // Update quote
    Future<bool> updateQuote(QuoteModel quote) async {
      _isLoading = true;
      notifyListeners();

      final result = await _quoteService.updateQuote(quote);

      _isLoading = false;
      notifyListeners();

      return result;
    }

    // Delete quote
    Future<bool> deleteQuote(String quoteId) async {
      _isLoading = true;
      notifyListeners();

      final result = await _quoteService.deleteQuote(quoteId);

      _isLoading = false;
      notifyListeners();

      return result;
    }

    // Toggle favorite
    Future<bool> toggleFavorite(String quoteId, bool isFavorite) async {
      return await _quoteService.toggleFavorite(quoteId, isFavorite);
    }
}
