import 'package:andromotest/screens/Home.dart';
import 'package:andromotest/screens/ImageScreen.dart';
import 'package:go_router/go_router.dart';

class Routes{
  GoRoute home = GoRoute(
    path: "/",
    name: "home",
    routes: [image],
    pageBuilder: ((context, state){
      return NoTransitionPage(
        child: Home()
      );
    })
  );
  static GoRoute image = GoRoute(
    path: "image",
    name: "image",
    pageBuilder: ((context, state){
      return NoTransitionPage(
        child: ImageScreen(
          url: state.extra as String,
        )
      );
    })
  );
}