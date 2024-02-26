import 'package:app_demo_gemini/config/theme/app_style.dart';
import 'package:app_demo_gemini/domain/bloc/blocs.dart';
import 'package:app_demo_gemini/domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TextMsg extends StatefulWidget {
  const TextMsg({super.key});

  @override
  State<TextMsg> createState() => _TextMsgState();
}

class _TextMsgState extends State<TextMsg> {
  final msg = TextEditingController();
  @override
  void dispose() {
    msg.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appGemini = context.watch<AppGeminiCubit>();
    return Container(
      padding: const EdgeInsets.all(20),
      decoration:
          BoxDecoration(border: Border.all(), color: AppStyle.fillColor),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (appGemini.state.isLoading)
            const Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  Text("Generando respuesta "),
                  SizedBox(
                    width: 100,
                    child: SpinKitThreeBounce(
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.76,
                child: TextFormField(
                  controller: msg,
                  minLines: 1,
                  maxLines: 4,
                ),
              ),
              IconButton(
                  onPressed: () async {
                    if (msg.text.isEmpty) {
                      return;
                    }
                    var data = AppResponse(user: Users.user, detail: msg.text);
                    appGemini.addItem(data);
                    appGemini.generateResponse(msg.text);
                    setState(() {
                      msg.clear();
                    });
                  },
                  icon: const Icon(
                    Icons.send,
                    size: 32,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
