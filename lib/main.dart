import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'providers/quote_provider.dart';
import 'screens/home_screen.dart';
import 'theme/app_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Force portrait orientation
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  // Transparent status bar
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(
    ChangeNotifierProvider(
      create: (_) => QuoteProvider(),
      child: const QuoteSparkApp(),
    ),
  );
}

class QuoteSparkApp extends StatelessWidget {
  const QuoteSparkApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuoteSpark',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme.copyWith(
        textTheme: GoogleFonts.interTextTheme(AppTheme.darkTheme.textTheme)
            .apply(bodyColor: AppTheme.textPrimary),
      ),
      home: const _SplashGate(),
    );
  }
}

/// Shows a splash screen briefly, then navigates to [HomeScreen].
class _SplashGate extends StatefulWidget {
  const _SplashGate();

  @override
  State<_SplashGate> createState() => _SplashGateState();
}

class _SplashGateState extends State<_SplashGate>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _fadeAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 900),
    );
    _fadeAnim = CurvedAnimation(parent: _ctrl, curve: Curves.easeOut);
    _scaleAnim = Tween<double>(begin: 0.78, end: 1.0).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.elasticOut),
    );

    _ctrl.forward();

    // Navigate after splash
    Future.delayed(const Duration(milliseconds: 2000), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 600),
            pageBuilder: (context, animation, secondaryAnimation) => const HomeScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: CurvedAnimation(
                    parent: animation, curve: Curves.easeOut),
                child: child,
              );
            },
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF1A1A2E),
              Color(0xFF16213E),
              Color(0xFF0F3460),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _fadeAnim,
            child: ScaleTransition(
              scale: _scaleAnim,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Logo
                  Container(
                    width: 96,
                    height: 96,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFE94560), Color(0xFFF5A623)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.circular(28),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFFE94560).withValues(alpha: 0.5),
                          blurRadius: 32,
                          spreadRadius: 4,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.format_quote_rounded,
                      color: Colors.white,
                      size: 52,
                    ),
                  ),
                  const SizedBox(height: 28),

                  // App name
                  Text(
                    'QuoteSpark',
                    style: GoogleFonts.playfairDisplay(
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Words that ignite your day',
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.white60,
                      letterSpacing: 0.6,
                    ),
                  ),
                  const SizedBox(height: 48),

                  // Animated dots indicator
                  const _LoadingDots(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Three pulsing dots loading indicator.
class _LoadingDots extends StatefulWidget {
  const _LoadingDots();

  @override
  State<_LoadingDots> createState() => _LoadingDotsState();
}

class _LoadingDotsState extends State<_LoadingDots>
    with TickerProviderStateMixin {
  final List<AnimationController> _ctls = [];
  final List<Animation<double>> _anims = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 3; i++) {
      final ctrl = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600),
      );
      final anim = Tween<double>(begin: 0.3, end: 1.0).animate(
        CurvedAnimation(parent: ctrl, curve: Curves.easeInOut),
      );
      _ctls.add(ctrl);
      _anims.add(anim);

      Future.delayed(Duration(milliseconds: i * 180), () {
        if (mounted) {
          ctrl.repeat(reverse: true);
        }
      });
    }
  }

  @override
  void dispose() {
    for (final c in _ctls) {
      c.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(3, (i) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 4),
          child: FadeTransition(
            opacity: _anims[i],
            child: Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFFE94560),
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      }),
    );
  }
}
