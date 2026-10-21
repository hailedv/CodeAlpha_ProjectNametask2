import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../models/quote.dart';
import '../providers/quote_provider.dart';
import '../theme/app_theme.dart';

/// Screen that shows the user's saved favourite quotes.
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDeep,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.07),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new_rounded,
                          color: Colors.white, size: 18),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Favourites',
                        style: GoogleFonts.playfairDisplay(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                      Consumer<QuoteProvider>(
                        builder: (context, p, child) => Text(
                          '${p.favoriteQuotes.length} quotes saved',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: AppTheme.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // List
            Expanded(
              child: Consumer<QuoteProvider>(
                builder: (context, provider, child) {
                  final favs = provider.favoriteQuotes;

                  if (favs.isEmpty) {
                    return const _EmptyState();
                  }

                  return ListView.separated(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 4),
                    itemCount: favs.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, i) =>
                        _FavoriteItem(quote: favs[i]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Empty state ───────────────────────────────────────────────────────────────

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFFE94560).withValues(alpha: 0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.favorite_border_rounded,
              size: 52,
              color: const Color(0xFFE94560).withValues(alpha: 0.6),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            'No favourites yet',
            style: GoogleFonts.playfairDisplay(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: AppTheme.textPrimary,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tap ♥ on any quote to save it here.',
            style: GoogleFonts.inter(
              fontSize: 14,
              color: AppTheme.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Favourite item card ───────────────────────────────────────────────────────

class _FavoriteItem extends StatelessWidget {
  final Quote quote;

  const _FavoriteItem({required this.quote});

  Future<void> _share() async {
    final text = '"${quote.text}"\n\n— ${quote.author}';
    await Share.share(text);
  }

  @override
  Widget build(BuildContext context) {
    final gradColors = AppTheme.categoryGradient(quote.category);

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: gradColors[0].withValues(alpha: 0.25),
          width: 1,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Gradient header strip
          Container(
            height: 4,
            decoration: BoxDecoration(
              gradient: LinearGradient(colors: gradColors),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Category badge
                Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: gradColors[0].withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '${quote.category.emoji} ${quote.category.displayName}',
                    style: GoogleFonts.inter(
                      fontSize: 10.5,
                      fontWeight: FontWeight.w700,
                      color: gradColors[0],
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // Quote text
                Text(
                  '"${quote.text}"',
                  style: GoogleFonts.playfairDisplay(
                    fontSize: 15,
                    color: AppTheme.textPrimary,
                    height: 1.5,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                const SizedBox(height: 8),

                // Author + actions
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        '— ${quote.author}',
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: AppTheme.textSecondary,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    // Use quote on home screen
                    _SmallBtn(
                      icon: Icons.open_in_new_rounded,
                      color: AppTheme.accentTeal,
                      onTap: () {
                        context.read<QuoteProvider>().setQuote(quote);
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(width: 6),
                    // Share
                    _SmallBtn(
                      icon: Icons.share_rounded,
                      color: AppTheme.accentAmber,
                      onTap: _share,
                    ),
                    const SizedBox(width: 6),
                    // Remove from favourites
                    Consumer<QuoteProvider>(
                      builder: (context, provider, child) => _SmallBtn(
                        icon: Icons.favorite_rounded,
                        color: const Color(0xFFE94560),
                        onTap: () =>
                            provider.toggleFavoriteById(quote.id),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SmallBtn extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _SmallBtn(
      {required this.icon, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(7),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, size: 15, color: color),
      ),
    );
  }
}
