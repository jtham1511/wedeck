import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class WeDeckFirebaseUser {
  WeDeckFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

WeDeckFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<WeDeckFirebaseUser> weDeckFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<WeDeckFirebaseUser>(
      (user) {
        currentUser = WeDeckFirebaseUser(user);
        return currentUser!;
      },
    );
