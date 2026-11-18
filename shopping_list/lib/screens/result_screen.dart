import 'package:flutter/material.dart';
import '../models/question.dart';

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;
  final List<int?> userAnswers;

  const ResultScreen({
    super.key,
    required this.score,
    required this.total,
    required this.userAnswers,
  });

  static const _mellowPurple = Color(0xFF8E7CC3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.emoji_events, size: 56, color: _mellowPurple),
              const SizedBox(height: 12),
              Text(
                'You scored $score out of $total!',
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4A4468),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: quizQuestions.length,
                  itemBuilder: (context, index) {
                    final question = quizQuestions[index];
                    final userAnswerIndex = userAnswers[index];
                    final wasCorrect = userAnswerIndex == question.correctIndex;

                    return Card(
                      margin: const EdgeInsets.only(bottom: 12),
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              question.text,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4A4468),
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              children: [
                                Icon(
                                  wasCorrect ? Icons.check_circle : Icons.cancel,
                                  color: wasCorrect ? Colors.green : Colors.red,
                                  size: 18,
                                ),
                                const SizedBox(width: 6),
                                Expanded(
                                  child: Text(
                                    'Your answer: ${userAnswerIndex != null ? question.answers[userAnswerIndex] : "No answer"}',
                                    style: TextStyle(
                                      color: wasCorrect ? Colors.green.shade700 : Colors.red.shade700,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            if (!wasCorrect) ...[
                              const SizedBox(height: 4),
                              Text(
                                'Correct answer: ${question.answers[question.correctIndex]}',
                                style: TextStyle(color: Colors.green.shade700),
                              ),
                            ],
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                icon: const Icon(Icons.refresh),
                label: const Text('Restart Quiz'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _mellowPurple,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}