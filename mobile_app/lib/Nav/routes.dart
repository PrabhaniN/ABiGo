import 'package:fluro/fluro.dart';
import 'package:Abigo/Model/user.dart';
import 'package:Abigo/Screens/signup.dart';

class Routes {

  static final signPageHandler = Handler(handlerFunc: (_, Map<String, List<String>> params) {
    return SignupPage(id: params['id'].first);
  });

  static void defineRoutes(Router router) {
    router.define("/user/:id", handler:signPageHandler);
  }
}