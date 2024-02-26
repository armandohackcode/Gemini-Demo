import 'package:app_demo_gemini/config/theme/app_style.dart';
import 'package:app_demo_gemini/domain/domain.dart';
import 'package:app_demo_gemini/ui/widgets/home/bold_text_parser.dart';
import 'package:flutter/material.dart';

class CardContent extends StatelessWidget {
  const CardContent({super.key, required this.data});
  final AppResponse data;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          color: (data.user == Users.gemini)
              ? const Color.fromARGB(255, 29, 32, 39)
              : const Color.fromARGB(255, 67, 57, 57),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            (data.user == Users.gemini) ? "Gemini ✧" : "Tú",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 16,
                color: (data.user == Users.gemini)
                    ? AppStyle.titleColor
                    : Colors.white,
                fontWeight: FontWeight.w600),
          ),
          BoldTextParser(text: data.detail)
        ],
      ),
    );
  }
}
