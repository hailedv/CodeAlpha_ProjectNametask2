import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../providers/quote_provider.dart';
import '../theme/app_theme.dart';
import '../widgets/quote_card.dart';
import '../widgets/category_filter_row.dart';
import 'favorites_screen.dart';

/// The main home screen of the app.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.primaryDeep,
      body: SafeArea(
        child: Column(
          children: [
            const _AppBar(),
            const SizedBox(height: 8),
            const _StatsRow(),
            const SizedBox(height: 16),
            const CategoryFilterRow(),
            const SizedBox(height: 20),
            const Expanded(child: _QuoteSection()),
            const SizedBox(height: 16),
            const _NextQuoteButton(),
            const SizedBox(height: 28),
          ],
        ),
      ),
    );
  }
}

// ── App bar ──────────────────────────────────────────────────────────────────

class _AppBar extends StatelessWidget {
  const _AppBar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 16, 0),
      child: Row(
        children: [
          // App logo + title
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFE94560), Color(0xFFF5A623)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFE94560).withValues(alpha: 0.4),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const Icon(Icons.format_quote_rounded,
                color: Colors.white, size: 24),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'QuoteSpark',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
              ),
              Text(
                'Daily inspiration',
                style: GoogleFonts.inter(
                  fontSize: 11,
                  color: AppTheme.textSecondary,
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
          const Spacer(),
          // Favourites button
          _NavButton(
            icon: Icons.favorite_rounded,
            color: const Color(0xFFE94560),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const FavoritesScreen()),
            ),
          ),
        ],
      ),
    );
  }
}

class _NavButton extends StatelessWidget {
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _NavButton(
      {required this.icon, required this.color, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: color.withValues(alpha: 0.25), width: 1),
        ),
        child: Icon(icon, color: color, size: 22),
      ),
    );
  }
}

// ── Stats row ────────────────────────────────────────────────────────────────

class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    return Consumer<QuoteProvider>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            children: [
              _StatChip(
                icon: Icons.visibility_outlined,
                label: '${provider.quotesViewed} viewed',
                color: AppTheme.accentTeal,
              ),
              const SizedBox(width: 10),
              _StatChip(
                icon: Icons.favorite_rounded,
                label: '${provider.favoriteIds.length} saved',
                color: const Color(0xFFE94560),
              ),
              const SizedBox(width: 10),
              _StatChip(
                icon: Icons.library_books_outlined,
                label: '${provider.totalQuotes} total',
                color: AppTheme.accentAmber,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StatChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const _StatChip(
      {required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: color.withValues(alpha: 0.2), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: color),
          const SizedBox(width: 5),
          Text(
            label,
            style: GoogleFonts.inter(
              fontSize: 11.5,
              color: color,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

// ── Quote section ────────────────────────────────────────────────────────────

class _QuoteSection extends StatelessWidget {
  const _QuoteSection();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        children: [
          QuoteCard(),
        ],
      ),
    );
  }
}

// ── Next Quote button ────────────────────────────────────────────────────────

class _NextQuoteButton extends StatefulWidget {
  const _NextQuoteButton();

  @override
  State<_NextQuoteButton> createState() => _NextQuoteButtonState();
}

class _NextQuoteButtonState extends State<_NextQuoteButton>
    with SingleTickerProviderStateMixin {
  late AnimationController _btnCtrl;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _btnCtrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 120),
      lowerBound: 0.0,
      upperBound: 0.04,
    );
    _scaleAnim = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _btnCtrl, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _btnCtrl.dispose();
    super.dispose();
  }

  Future<void> _onTap() async {
    await _btnCtrl.forward();
    await _btnCtrl.reverse();
    if (mounted) {
      context.read<QuoteProvider>().nextQuote();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: ScaleTransition(
        scale: _scaleAnim,
        child: GestureDetector(
          onTap: _onTap,
          child: Container(
            width: double.infinity,
            height: 58,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFFE94560), Color(0xFFF5A623)],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFE94560).withValues(alpha: 0.45),
                  blurRadius: 20,
                  spreadRadius: 2,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.auto_awesome_rounded,
                    color: Colors.white, size: 22),
                const SizedBox(width: 10),
                Text(
                  'New Quote',
                  style: GoogleFonts.inter(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
