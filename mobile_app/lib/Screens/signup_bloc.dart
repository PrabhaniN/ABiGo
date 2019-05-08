import 'package:Abigo/Model/user.dart';
import 'package:Abigo/Bloc/base_bloc.dart';

class SignUpBloc extends BaseBloc {
  Future<Null> onboardUser(User user) async {
    await firestore.collection(Collections.USER).document(user.id).setData(user.toMap());
  }

  @override
  void onDispose(){}
}