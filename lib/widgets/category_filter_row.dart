import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../models/quote.dart';
import '../providers/quote_provider.dart';
import '../theme/app_theme.dart';

/// Horizontally scrollable row of category filter chips.
class CategoryFilterRow extends StatelessWidget {
  const CategoryFilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuoteProvider>(
      builder: (context, provider, child) {
        return SizedBox(
          height: 44,
          child: ListView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              // "All" chip
              _CategoryChip(
                label: '✨ All',
                isSelected: provider.selectedCategory == null,
                gradColors: [
                  const Color(0xFF667EEA),
                  const Color(0xFF764BA2),
                ],
                onTap: () => provider.selectCategory(null),
              ),
              const SizedBox(width: 8),
              // One chip per category
              ...QuoteCategory.values.map((cat) {
                final isSelected = provider.selectedCategory == cat;
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: _CategoryChip(
                    label: '${cat.emoji} ${cat.displayName}',
                    isSelected: isSelected,
                    gradColors: AppTheme.categoryGradient(cat),
                    onTap: () => provider.selectCategory(
                      isSelected ? null : cat,
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}

class _CategoryChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final List<Color> gradColors;
  final VoidCallback onTap;

  const _CategoryChip({
    required this.label,
    required this.isSelected,
    required this.gradColors,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: isSelected
              ? LinearGradient(colors: gradColors)
              : null,
          color: isSelected ? null : const Color(0xFF1E2A45),
          borderRadius: BorderRadius.circular(22),
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : Colors.white.withValues(alpha: 0.12),
            width: 1,
          ),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: gradColors[0].withValues(alpha: 0.4),
                    blurRadius: 12,
                    spreadRadius: 1,
                    offset: const Offset(0, 4),
                  )
                ]
              : [],
        ),
        child: Text(
          label,
          style: GoogleFonts.inter(
            fontSize: 12.5,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : AppTheme.textSecondary,
          ),
        ),
      ),
    );
  }
}
