import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPageCubit extends Cubit<bool> {
  LoginPageCubit() : super(false); // Default color is false (not red)

  void signIn(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email, password: password);
      emit(false); // Reset color to default on success
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        emit(true); // Turn color red on failure
      } else {
        emit(true); // For any other errors, change color
      }
    }
  }
} 
