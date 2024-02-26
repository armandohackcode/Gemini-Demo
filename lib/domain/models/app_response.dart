class AppResponse {
  Users user;
  String detail;

  AppResponse({
    required this.user,
    required this.detail,
  });

  AppResponse copyWith({
    Users? user,
    String? detail,
  }) =>
      AppResponse(
        user: user ?? this.user,
        detail: detail ?? this.detail,
      );
}

enum Users { gemini, user }
