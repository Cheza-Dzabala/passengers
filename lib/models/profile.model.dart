import 'dart:typed_data';

class Profile {
  late String avatar;
  late String displayName;
  late String firstName;
  late String lastName;
  late String gender;
  late String description;
  late bool isActivated;
  late String phoneNumber;

  Profile({
    this.avatar = '',
    this.displayName = '',
    this.firstName = '',
    this.lastName = '',
    this.gender = '',
    this.description = '',
    this.isActivated = false,
    this.phoneNumber = '',
  });

  String getFullName() => '$firstName $lastName';

  Profile copyWith({
    String? avatar,
    String? displayName,
    String? firstName,
    String? lastName,
    String? gender,
    String? description,
    bool? isActivated,
    String? phoneNumber,
  }) {
    return Profile(
      avatar: avatar ?? this.avatar,
      displayName: displayName ?? this.displayName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      description: description ?? this.description,
      isActivated: isActivated ?? this.isActivated,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'avatar': avatar,
      'display_name': displayName,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'description': description,
      'is_activated': isActivated,
      'phone_number': phoneNumber,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      avatar: map['avatar'],
      displayName: map['display_name'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      gender: map['gender'],
      description: map['description'],
      isActivated: map['is_activated'],
      phoneNumber: map['phone_number'],
    );
  }
}
