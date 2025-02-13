import 'package:flutter/material.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map((data) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ((data['question_index'] as int) + 1).toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 10), // Added spacing between number and text
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text properly
                    children: [
                      Text(
                        data['question'] as String,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      Text('Your Answer: ${data['user_answer']}', style: const TextStyle(color: Colors.red)),
                      Text('Correct Answer: ${data['correct_answer']}', style: const TextStyle(color: Colors.green)),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
