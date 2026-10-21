import 'dart:math';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/quote.dart';
import '../data/quotes_data.dart';

/// Central state manager for the quote app.
class QuoteProvider extends ChangeNotifier {
  final Random _random = Random();

  Quote _currentQuote = kAllQuotes[0];
  QuoteCategory? _selectedCategory;
  Set<String> _favoriteIds = {};
  int _quotesViewed = 0;
  bool _isAnimating = false;

  // ── Getters ────────────────────────────────────────────────────────────────

  Quote get currentQuote => _currentQuote;
  QuoteCategory? get selectedCategory => _selectedCategory;
  Set<String> get favoriteIds => _favoriteIds;
  int get quotesViewed => _quotesViewed;
  bool get isAnimating => _isAnimating;

  bool get isCurrentFavorite => _favoriteIds.contains(_currentQuote.id);

  List<Quote> get filteredQuotes {
    if (_selectedCategory == null) return kAllQuotes;
    return kAllQuotes
        .where((q) => q.category == _selectedCategory)
        .toList();
  }

  List<Quote> get favoriteQuotes =>
      kAllQuotes.where((q) => _favoriteIds.contains(q.id)).toList();

  int get totalQuotes => kAllQuotes.length;

  // ── Initialization ─────────────────────────────────────────────────────────

  QuoteProvider() {
    _loadFavorites();
    _pickRandom();
  }

  Future<void> _loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    final saved = prefs.getStringList('favorite_ids') ?? [];
    _favoriteIds = saved.toSet();
    notifyListeners();
  }

  Future<void> _saveFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('favorite_ids', _favoriteIds.toList());
  }

  // ── Actions ────────────────────────────────────────────────────────────────

  /// Pick a random quote from the currently active category (if any).
  void nextQuote() {
    final pool = filteredQuotes;
    if (pool.isEmpty) return;

    // Avoid showing the same quote twice in a row
    Quote next;
    do {
      next = pool[_random.nextInt(pool.length)];
    } while (next.id == _currentQuote.id && pool.length > 1);

    _currentQuote = next;
    _quotesViewed++;
    notifyListeners();
  }

  /// Immediately set a specific quote (used from favorites screen).
  void setQuote(Quote quote) {
    _currentQuote = quote;
    _quotesViewed++;
    notifyListeners();
  }

  /// Toggle the selected category filter.
  void selectCategory(QuoteCategory? category) {
    _selectedCategory = category;
    notifyListeners();
    nextQuote();
  }

  /// Toggle favourite status for the current quote.
  void toggleFavorite() {
    if (_favoriteIds.contains(_currentQuote.id)) {
      _favoriteIds.remove(_currentQuote.id);
    } else {
      _favoriteIds.add(_currentQuote.id);
    }
    _saveFavorites();
    notifyListeners();
  }

  /// Toggle favourite status for any given quote.
  void toggleFavoriteById(String id) {
    if (_favoriteIds.contains(id)) {
      _favoriteIds.remove(id);
    } else {
      _favoriteIds.add(id);
    }
    _saveFavorites();
    notifyListeners();
  }

  void _pickRandom() {
    _currentQuote = kAllQuotes[_random.nextInt(kAllQuotes.length)];
    _quotesViewed = 1;
  }

  void setAnimating(bool value) {
    _isAnimating = value;
    notifyListeners();
  }
}
