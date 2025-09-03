import 'package:cloud_firestore/cloud_firestore.dart';

import '../utils/date_formate/date_time_formatter.dart';

class UserModel {
  final String? uid;
  final String? email;
  final String? name;
  final Timestamp? createdAt;

  UserModel({this.uid, this.email, this.name, this.createdAt});

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
      uid: data['uid'],
      email: data['email'],
      name: data['name'],
      createdAt: data['createdAt'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'createdAt': createdAt,
    };
  }

  // Getters directly call utility methods
  String get formattedCreatedDate =>
      DateTimeFormatter.formatDate(createdAt, prefix: 'Joined: ');

  String get formattedCreatedDateTime =>
      DateTimeFormatter.formatDateTime(createdAt, prefix: 'Joined: ');

  String get formattedDateOnly =>
      DateTimeFormatter.formatDateOnly(createdAt);

  String get formattedTimeOnly =>
      DateTimeFormatter.formatTimeOnly(createdAt);

 /* // Format created date for display using intl package
  String get formattedCreatedDate {
    if (createdAt == null) return 'Unknown date';

    final date = createdAt!.toDate();
    final formatter = DateFormat('dd-MMM-yyyy');
    return 'Joined: ${formatter.format(date)}';
  }

  // Agar time bhi chahiye toh
  String get formattedCreatedDateTime {
    if (createdAt == null) return 'Unknown date';

    final date = createdAt!.toDate();
    final formatter = DateFormat('dd-MMM-yyyy hh:mm a');
    return 'Joined: ${formatter.format(date)}';
  }

  // Sirf date ke liye
  String get formattedDateOnly {
    if (createdAt == null) return 'Unknown date';

    final date = createdAt!.toDate();
    final formatter = DateFormat('dd-MMM-yyyy');
    return formatter.format(date);
  }

  // Sirf time ke liye
  String get formattedTimeOnly {
    if (createdAt == null) return 'Unknown time';

    final date = createdAt!.toDate();
    final formatter = DateFormat('hh:mm a');
    return formatter.format(date);
  }*/
}