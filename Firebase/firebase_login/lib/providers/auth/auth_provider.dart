import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_login/models/user/user_model.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseFirestore.instance;

  User? get currentUser => _auth.currentUser;
  bool get isLoggedIn => currentUser != null;

  UserModel? appUser;

  // Loading $ Error state
  bool isLoading = true;
  String? errorMsg;
  
  AuthProvider() {
    _auth.authStateChanges().listen((user) async {
      if (user != null) {
        final snap = await _db.collection("users").doc(user.uid).get();
        if (snap.exists) {
          appUser = UserModel.fromMap(snap.data()!);
        }
      } else {
        appUser = null;
      }
      isLoading = false;
      notifyListeners();
    });
  }
  
  Future<void> register(String name, String email, String password) async {
    try {
      _setLoading(true);

      final cred = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password
      );

      final newUser = UserModel(
          id: cred.user!.uid,
          name: name,
          email: email,
          createdAt: DateTime.now()
      );

      await _db.collection("users").doc(newUser.id).set(newUser.toMap());
      appUser = newUser;
    } on FirebaseAuthException catch (e) {
      errorMsg = e.message;
    } catch (e) {
      errorMsg = "Something went wrong: $e";
    } finally {
      _setLoading(false);
    }
  }

  Future<void> login(String email, String password) async {
    try {
      _setLoading(true);

      final cread = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      final snap = await _db.collection("users").doc(cread.user!.uid).get();
      if (snap.exists) {
        appUser = UserModel.fromMap(snap.data()!);
      }
    } on FirebaseAuthException catch (e) {
      errorMsg = e.message;
    } catch (e) {
      errorMsg = "Something went wrong: $e";
    } finally {
      _setLoading(false);
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    appUser = null;
    notifyListeners();
  }

  /// 🔹 Helper to set loading
  void _setLoading(bool value) {
    isLoading = value;
    errorMsg = null;
    notifyListeners();
  }
}