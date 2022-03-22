import 'dart:typed_data';

class Profile {
  late String id;
  late Uint8List? avatar;
  late String displayName;
  late String firstName;
  late String lastName;
  late String gender;
  late String country;
  late String city;
  late String description;
  late bool isActivated;

  Profile({
    this.id = '',
    this.avatar,
    this.displayName = '',
    this.firstName = '',
    this.lastName = '',
    this.gender = '',
    this.country = '',
    this.city = '',
    this.description = '',
    this.isActivated = false,
  });

  Profile copyWith({
    String? id,
    Uint8List? avatar,
    String? displayName,
    String? firstName,
    String? lastName,
    String? gender,
    String? country,
    String? city,
    String? description,
    bool? isActivated,
  }) {
    return Profile(
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      displayName: displayName ?? this.displayName,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      country: country ?? this.country,
      city: city ?? this.city,
      description: description ?? this.description,
      isActivated: isActivated ?? this.isActivated,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'avatar': avatar,
      'display_name': displayName,
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'country': country,
      'city': city,
      'description': description,
      'is_activated': isActivated,
    };
  }

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      id: map['id'],
      avatar: map['avatar'],
      displayName: map['display_name'],
      firstName: map['first_name'],
      lastName: map['last_name'],
      gender: map['gender'],
      country: map['country'],
      city: map['city'],
      description: map['description'],
      isActivated: map['is_activated'],
    );
  }
}
