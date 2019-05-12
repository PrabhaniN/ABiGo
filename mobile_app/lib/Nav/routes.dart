import 'package:fluro/fluro.dart';
import 'package:Abigo/Screens/signup.dart';
import 'package:Abigo/Screens/chatPage.dart';

class Routes {

  static final signPageHandler = Handler(handlerFunc: (_, Map<String, List<String>> params) {
    return SignupPage(id: params['id'].first);
  });

  static final chatPageHandler =Handler(handlerFunc: (_, Map<String, List<String>> params) {
    return ChatPage(id: params['id'].first);
  });

  static void defineRoutes(Router router) {
    router.define("/signup/:id", handler:signPageHandler);
  }
}