import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/user_model.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  // Get complete user data from Firestore
  Future<UserModel?> _getUserWithFirestoreData(String uid) async {
    try {
      DocumentSnapshot userDoc = await _firestore.collection('users').doc(uid).get();
      if (userDoc.exists) {
        Map<String, dynamic> data = userDoc.data() as Map<String, dynamic>;
        return UserModel(
          uid: data['uid'],
          email: data['email'],
          name: data['name'],
          createdAt: data['createdAt'],
        );
      }
      return null;
    } catch (e) {
      print('Error getting user data from Firestore: $e');
      return null;
    }
  }

  // Auth change user stream with BOTH Auth + Firestore data
  Stream<UserModel?> get user {
    return _auth.authStateChanges().asyncMap((User? firebaseUser) async {
      if (firebaseUser == null) return null;

      // Firestore se complete user data lao
      UserModel? userWithFullData = await _getUserWithFirestoreData(firebaseUser.uid);

      // Agar Firestore se data mil gaya toh woh return karo
      if (userWithFullData != null) {
        return userWithFullData;
      }

      // Nahin toh basic Firebase Auth data return karo
      return UserModel(
        uid: firebaseUser.uid,
        email: firebaseUser.email,
        name: "User",
        createdAt: Timestamp.now(),
      );
    });
  }

  // Sign in with email and password
  Future<UserModel?> signInWithEmail(String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      if (user != null) {
        // Firestore se complete user data lao
        return await _getUserWithFirestoreData(user.uid);
      }
      return null;
    } catch (e) {
      print('Login error: $e');
      return null;
    }
  }

  // Register with email and password
  Future<UserModel?> registerWithEmail(String email, String password, String name) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = result.user;

      if (user != null) {
        Timestamp createdAt = Timestamp.now();
        // Create user document in Firestore with name
        await _firestore.collection('users').doc(user.uid).set({
          'uid': user.uid,
          'email': email,
          'name': name,
          'createdAt': createdAt,
        });

        // Return user with complete data
        return UserModel(uid: user.uid, email: email, name: name, createdAt: createdAt);
      }
      return null;
    } catch (e) {
      print('Registration error: $e');
      return null;
    }
  }

  // Sign out
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Logout error: $e');
    }
  }
}