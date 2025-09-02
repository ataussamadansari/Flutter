import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel
{
    final String id;
    final String name;
    final String email;
    final DateTime createdAt;

    UserModel({
        required this.id,
        required this.name,
        required this.email,
        required this.createdAt
    });

    // Convert object -> map
    Map<String, dynamic> toMap() {
        return {
            "id" : id,
            "name": name,
            "email": email,
            "createdAt": createdAt
        };
    }

    // Convert Map -> Object
    factory UserModel.fromMap(Map<String, dynamic> map) {
      return UserModel(
          id: map['id'],
          name: map['name'],
          email: map['email'],
          createdAt: (map['createdAt'] as Timestamp).toDate()
      );
    }

}
