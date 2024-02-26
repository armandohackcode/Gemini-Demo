part of 'app_gemini_cubit.dart';

class AppGeminiState extends Equatable {
  final List<AppResponse> list;
  final bool isLoading; // Nuevo campo para manejar el estado de carga

  const AppGeminiState({
    required this.list,
    required this.isLoading, // Asegúrate de inicializar el nuevo campo en el constructor
  });

  @override
  List<Object> get props => [list, isLoading];

  AppGeminiState copyWith({
    List<AppResponse>? list,
    bool? isLoading, // Añade el nuevo campo a la función copyWith
  }) {
    return AppGeminiState(
      list: list ?? this.list,
      isLoading: isLoading ??
          this.isLoading, // Asegúrate de incluir el nuevo campo en la copia
    );
  }
}
