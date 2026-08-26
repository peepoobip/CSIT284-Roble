import 'package:flutter/material.dart';
 
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
 
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
 
class _HomeScreenState extends State<HomeScreen> {
  
  static const Color _backgroundColor = Color(0xFF1A0000);
 
  static const List<Color> _textColors = [
    Colors.white,
    Color(0xFFE94560), 
    Color(0xFFFFD93D), 
    Color(0xFF16A085), 
    Color(0xFFF39C12), 
  ];
 
  int _textColorIndex = 0;
 
  void _handleStartQuiz() {
    setState(() {
      _textColorIndex = (_textColorIndex + 1) % _textColors.length;
    });
 
    
  }
 
  @override
  Widget build(BuildContext context) {
    final Color textColor = _textColors[_textColorIndex];
 
    return Scaffold(
      backgroundColor: _backgroundColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(flex: 3),
 
          
            Transform.translate(
              offset: const Offset(2.5, -4.5),
              child: Image.asset(
                'assets/logo.png',
                width: 220,
              ),
            ),
 
            const Spacer(flex: 1),
 
           
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