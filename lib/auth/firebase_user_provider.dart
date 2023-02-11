import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class MindChatAppFirebaseUser {
  MindChatAppFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

MindChatAppFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<MindChatAppFirebaseUser> mindChatAppFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<MindChatAppFirebaseUser>(
      (user) {
        currentUser = MindChatAppFirebaseUser(user);
        return currentUser!;
      },
    );
