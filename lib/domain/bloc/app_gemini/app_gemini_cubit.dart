import 'package:app_demo_gemini/config/helpers/custom_gemini.dart';
import 'package:app_demo_gemini/domain/domain.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'app_gemini_state.dart';

class AppGeminiCubit extends Cubit<AppGeminiState> {
  AppGeminiCubit({List<AppResponse> list = const []})
      : super(AppGeminiState(list: list, isLoading: false));
  final ScrollController scrollController = ScrollController();
  void addItem(AppResponse data) {
    emit(state.copyWith(list: [...state.list, data]));
    moveScrollToBottom();
  }

  Future<void> generateResponse(String text) async {
    emit(state.copyWith(isLoading: true));
    var res =
        await CustomGemini().generateResponse(list: state.list, newText: text);
    if (res != null) {
      addItem(res);
    }
    emit(state.copyWith(isLoading: false));
  }

  void moveScrollToBottom() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 1000), curve: Curves.easeOut);
  }
}
