import 'package:app_demo_gemini/ui/screens/home.dart';
import 'package:bloc/bloc.dart';
import 'package:go_router/go_router.dart';

final _publicRouter = GoRouter(routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const Home(),
  ),
]);

class RouterSimpleCubit extends Cubit<GoRouter> {
  RouterSimpleCubit() : super(_publicRouter);
  void goBack() {
    state.pop();
  }

  void goHome() {
    state.go('/');
  }
}
