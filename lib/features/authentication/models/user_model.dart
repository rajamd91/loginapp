/*
   ======================
   Todo: Step -1 [Create Model]
   ======================
 */

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loginapp/utils/formatters/formatter.dart';

/// Model class representing user data
class UserModel {
  // Keep those values final which you do not want to update
  final String id;
  late final String firstName;
  late final String lastName;
  final String userName;
  final String email;
  String phoneNumber;
  String profilePicture;

  /// Constructor for user model
  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    required this.userName,
    required this.profilePicture,
  });

  /// Helper function to get the full name
  String get fullName => '$firstName $lastName';

  /// Helper function to format Phone Number
  String get formattedPhoneNo => TFormatter.formatPhoneNumber(phoneNumber);

  /// Static function to split full name in to first and last name.
  static List<String> nameParts(fullName) => fullName.split("");

  /// Static function to generate a user name from the full name
  static String generateUserName(fullName) {
    List<String> nameParts = fullName.split("");
    String firstName = nameParts[0].toLowerCase();
    String lastName = nameParts.length > 1 ? nameParts[1].toLowerCase() : "";

    /// Combine first and last name
    String camelCaseUserName = "$firstName$lastName";

    /// Add "cwt_" prefix
    String userNameWithPrefix = "cwt_$camelCaseUserName";

    return userNameWithPrefix;
  }

  // static function to create on empty user model
  static UserModel empty() => UserModel(
        id: '',
        firstName: '',
        lastName: '',
        userName: '',
        phoneNumber: '',
        email: '',
        profilePicture: '',
      );

  /// convert model to JSON structure for storing data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'FirstName': firstName,
      'LastName': lastName,
      'UserName': userName,
      'Email': email,
      'PhoneNumber': phoneNumber,
      'ProfilePicture': profilePicture
    };
  }

  /// Step 1-Map User fetched from Firebase to UserModel
  factory UserModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    if (document.data() != null) {
      final data = document.data()!;
      return UserModel(
        id: document.id,
        email: data["Email"] ?? '',
        firstName: data["FirstName"] ?? '',
        lastName: data["LastName"] ?? '',
        phoneNumber: data["PhoneNumber"] ?? '',
        userName: data["userName"] ?? '',
        profilePicture: data["profilePicture"] ?? '',
      );
    } else {
      return UserModel.empty();
    }
  }
}
