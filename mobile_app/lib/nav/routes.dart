import 'package:fluro/fluro.dart';
import 'package:Abigo/screens/signup/signup.dart';
import 'package:Abigo/screens/chatlist/chatList.dart';
import 'package:Abigo/screens/addchat/addChat.dart';

class Routes {

  static final signPageHandler = Handler(handlerFunc: (_, Map<String, List<String>> params) {
    return SignupPage(id: params['id'].first);
  });

  // static final chatListHandler =Handler(handlerFunc: (_, Map<String, List<String>> params) {
    // return ChatList(id: params['id'].first);
  // });

  static final chatListHandler =Handler(handlerFunc: (_, __) {
    return ChatList();
  });

  static final addChatHandler =Handler(handlerFunc: (_, __) {
    return AddChat();
  });

  static void defineRoutes(Router router) {
    router.define("/signup/:id", handler:signPageHandler);
    router.define("/chatlist", handler:chatListHandler);
    router.define("/addchat", handler: addChatHandler);
  }
}