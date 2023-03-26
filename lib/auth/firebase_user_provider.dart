import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class WeDeckBetaFirebaseUser {
  WeDeckBetaFirebaseUser(this.user);
  User? user;
  bool get loggedIn => user != null;
}

WeDeckBetaFirebaseUser? currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<WeDeckBetaFirebaseUser> weDeckBetaFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<WeDeckBetaFirebaseUser>(
      (user) {
        currentUser = WeDeckBetaFirebaseUser(user);
        return currentUser!;
      },
    );
