import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';
import '../models/quote.dart';
import '../providers/quote_provider.dart';
import '../theme/app_theme.dart';

/// The animated glassmorphism card that displays a quote.
class QuoteCard extends StatefulWidget {
  const QuoteCard({super.key});

  @override
  State<QuoteCard> createState() => _QuoteCardState();
}

class _QuoteCardState extends State<QuoteCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<Offset> _slideAnim;
  String _lastId = '';

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeOut);
    _slideAnim = Tween<Offset>(
      begin: const Offset(0, 0.06),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _triggerAnimation() {
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<QuoteProvider>(
      builder: (context, provider, child) {
        final quote = provider.currentQuote;

        // Re-animate whenever the quote changes
        if (quote.id != _lastId) {
          _lastId = quote.id;
          WidgetsBinding.instance
              .addPostFrameCallback((timestamp) => _triggerAnimation());
        }

        final gradColors = AppTheme.categoryGradient(quote.category);

        return FadeTransition(
          opacity: _fadeAnim,
          child: SlideTransition(
            position: _slideAnim,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                gradient: LinearGradient(
                  colors: gradColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: gradColors[0].withValues(alpha: 0.35),
                    blurRadius: 30,
                    spreadRadius: 4,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: _CardContent(quote: quote, provider: provider),
            ),
          ),
        );
      },
    );
  }
}

class _CardContent extends StatelessWidget {
  final Quote quote;
  final QuoteProvider provider;

  const _CardContent({required this.quote, required this.provider});

  Future<void> _share() async {
    final text = '"${quote.text}"\n\n— ${quote.author}';
    await Share.share(text);
  }

  Future<void> _copy(BuildContext context) async {
    await Clipboard.setData(
      ClipboardData(text: '"${quote.text}" — ${quote.author}'),
    );
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Quote copied to clipboard!',
            style: GoogleFonts.inter(fontSize: 13),
          ),
          backgroundColor: const Color(0xFF1E2A45),
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          duration: const Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(28),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Category badge
          _CategoryBadge(category: quote.category),
          const SizedBox(height: 20),

          // Opening quotation mark
          Text(
            '\u201C',
            style: GoogleFonts.playfairDisplay(
              fontSize: 80,
              color: Colors.white.withValues(alpha: 0.25),
              height: 0.6,
            ),
          ),
          const SizedBox(height: 8),

          // Quote text
          Text(
            quote.text,
            style: GoogleFonts.playfairDisplay(
              fontSize: 20,
              color: Colors.white,
              height: 1.55,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 24),

          // Divider
          Container(
            width: 48,
            height: 2,
            decoration: BoxDecoration(
              color: Colors.white.withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(1),
            ),
          ),
          const SizedBox(height: 16),

          // Author
          Row(
            children: [
              const Icon(Icons.person_outline,
                  color: Colors.white70, size: 18),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  quote.author,
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    color: Colors.white70,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Action buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _ActionButton(
                icon: provider.isCurrentFavorite
                    ? Icons.favorite
                    : Icons.favorite_border,
                tooltip: 'Favourite',
                activeColor: Colors.pinkAccent,
                isActive: provider.isCurrentFavorite,
                onTap: provider.toggleFavorite,
              ),
              const SizedBox(width: 8),
              _ActionButton(
                icon: Icons.copy_rounded,
                tooltip: 'Copy',
                onTap: () => _copy(context),
              ),
              const SizedBox(width: 8),
              _ActionButton(
                icon: Icons.share_rounded,
                tooltip: 'Share',
                onTap: _share,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _CategoryBadge extends StatelessWidget {
  final QuoteCategory category;

  const _CategoryBadge({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
            color: Colors.white.withValues(alpha: 0.3), width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(category.emoji, style: const TextStyle(fontSize: 14)),
          const SizedBox(width: 6),
          Text(
            category.displayName,
            style: GoogleFonts.inter(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.4,
            ),
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback onTap;
  final Color? activeColor;
  final bool isActive;

  const _ActionButton({
    required this.icon,
    required this.tooltip,
    required this.onTap,
    this.activeColor,
    this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: isActive
                ? Colors.white.withValues(alpha: 0.3)
                : Colors.white.withValues(alpha: 0.15),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Colors.white.withValues(alpha: 0.25),
              width: 1,
            ),
          ),
          child: Icon(
            icon,
            size: 20,
            color: isActive ? (activeColor ?? Colors.white) : Colors.white,
          ),
        ),
      ),
    );
  }
}
