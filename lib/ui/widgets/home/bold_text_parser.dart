import 'package:flutter/material.dart';

class BoldTextParser extends StatelessWidget {
  final String text;

  const BoldTextParser({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    List<TextSpan> children = [];
    RegExp exp = RegExp(r"\*\*(.*?)\*\*");

    String remainingText = text;
    Iterable<Match> matches = exp.allMatches(remainingText);

    int currentIndex = 0;
    for (Match match in matches) {
      // Add non-bold text before the match
      if (match.start > currentIndex) {
        children.add(
            TextSpan(text: remainingText.substring(currentIndex, match.start)));
      }

      // Add bold text
      String boldText = match.group(1)!; // Group 1 contains the text inside **
      children.add(TextSpan(
        text: boldText,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ));

      // Update current index
      currentIndex = match.end;
    }

    // Add any remaining text after the last match
    if (currentIndex < remainingText.length) {
      children.add(TextSpan(text: remainingText.substring(currentIndex)));
    }

    return RichText(
      text: TextSpan(
          children: children,
          style: const TextStyle(fontSize: 16, color: Colors.white)),
    );
  }
}
