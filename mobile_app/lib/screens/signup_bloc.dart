import 'package:Abigo/model/user.dart';
import 'package:Abigo/bloc/base_bloc.dart';

class SignUpBloc extends BaseBloc {
  Future<Null> signupUser(User user) async {
    await firestore.collection(Collections.USER).document(user.id).setData(user.toMap());
  }

  @override
  void onDispose(){}
}