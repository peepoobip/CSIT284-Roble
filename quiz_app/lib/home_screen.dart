import 'package:flutter/material.dart';
 
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
 
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
 
class _HomeScreenState extends State<HomeScreen> {
  // Background stays fixed — reddish-black.
  static const Color _backgroundColor = Color(0xFF1A0000);
 
  // Text color cycled on each "Start Quiz" press. Max 5 colors.
  static const List<Color> _textColors = [
    Colors.white,
    Color(0xFFE94560), // red-pink
    Color(0xFFFFD93D), // yellow
    Color(0xFF16A085), // teal green
    Color(0xFFF39C12), // amber/orange
  ];
 
  int _textColorIndex = 0;
 
  void _handleStartQuiz() {
    setState(() {
      _textColorIndex = (_textColorIndex + 1) % _textColors.length;
    });
 
    // Hook your actual quiz navigation here, e.g.:
    // Navigator.push(context, MaterialPageRoute(builder: (_) => const QuizScreen()));
  }
 
  @override
  Widget build(BuildContext context) {
    final Color textColor = _textColors[_textColorIndex];
 
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(flex: 3),
 
            // Logo image (already includes the question marks + Flutter arrow).
            Image.asset(
              'assets/logo.png',
              width: 220,
            ),
 
            const Spacer(flex: 1),
 
            // Tagline — color cycles on each "Start Quiz" press.
            Text(
              'Learn Flutter the fun way!',
              style: TextStyle(
                color: textColor,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
 
            const SizedBox(height: 32),
 
            TextButton(
              onPressed: _handleStartQuiz,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              child: const Text(
                'Start Quiz',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
 
            const Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}