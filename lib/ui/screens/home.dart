import 'package:app_demo_gemini/config/theme/app_style.dart';
import 'package:app_demo_gemini/domain/bloc/app_gemini/app_gemini_cubit.dart';
import 'package:app_demo_gemini/ui/widgets/home/card_content.dart';
import 'package:app_demo_gemini/ui/widgets/home/text_msg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final appGemini = context.watch<AppGeminiCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Gemini Demo ✧⋆",
          style: TextStyle(color: AppStyle.titleColor),
        ),
      ),
      body: ListView.builder(
        controller: appGemini.scrollController,
        itemCount: appGemini.state.list.length,
        padding: const EdgeInsets.only(bottom: 150),
        itemBuilder: (BuildContext context, int index) {
          var data = appGemini.state.list[index];

          return CardContent(data: data);
        },
      ),
      bottomNavigationBar: const TextMsg(),
    );
  }
}
