import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class Intern1FirebaseUser {
  Intern1FirebaseUser(this.user);
  User user;
  bool get loggedIn => user != null;
}

Intern1FirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<Intern1FirebaseUser> intern1FirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<Intern1FirebaseUser>(
        (user) => currentUser = Intern1FirebaseUser(user));
