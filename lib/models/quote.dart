/// Represents a single inspirational quote.
class Quote {
  final String id;
  final String text;
  final String author;
  final QuoteCategory category;

  const Quote({
    required this.id,
    required this.text,
    required this.author,
    required this.category,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Quote && other.id == id);

  @override
  int get hashCode => id.hashCode;
}

/// Categories of quotes available in the app.
enum QuoteCategory {
  motivation,
  wisdom,
  life,
  love,
  humor,
  success,
  courage,
  mindfulness,
}

/// Extension to get display name and emoji for each category.
extension QuoteCategoryExtension on QuoteCategory {
  String get displayName {
    switch (this) {
      case QuoteCategory.motivation:
        return 'Motivation';
      case QuoteCategory.wisdom:
        return 'Wisdom';
      case QuoteCategory.life:
        return 'Life';
      case QuoteCategory.love:
        return 'Love';
      case QuoteCategory.humor:
        return 'Humor';
      case QuoteCategory.success:
        return 'Success';
      case QuoteCategory.courage:
        return 'Courage';
      case QuoteCategory.mindfulness:
        return 'Mindfulness';
    }
  }

  String get emoji {
    switch (this) {
      case QuoteCategory.motivation:
        return '🔥';
      case QuoteCategory.wisdom:
        return '🦉';
      case QuoteCategory.life:
        return '🌿';
      case QuoteCategory.love:
        return '❤️';
      case QuoteCategory.humor:
        return '😄';
      case QuoteCategory.success:
        return '🏆';
      case QuoteCategory.courage:
        return '⚡';
      case QuoteCategory.mindfulness:
        return '🧘';
    }
  }
}
