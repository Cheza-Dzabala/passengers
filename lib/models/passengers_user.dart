import 'dart:convert';

class PassengersUser {
  String id;
  String avatar;
  String displayName;
  String firstName;
  String lastName;
  String gender;
  String country;
  String city;
  String description;
  bool isActivated;

  PassengersUser({
    required this.id,
    required this.avatar,
    required this.displayName,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.country,
    required this.city,
    required this.description,
    required this.isActivated,
  });

  PassengersUser copyWith({
    String? id,
    String? avatar,
    String? displayName,
    String? firstName,
    String? lastName,
    String? gender,
    String? country,
    String? city,
    String? description,
    bool? isActivated,
  }) {
    return PassengersUser(
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

  factory PassengersUser.fromMap(Map<String, dynamic> map) {
    return PassengersUser(
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

  String toJson() => json.encode(toMap());

  factory PassengersUser.fromJson(String source) =>
      PassengersUser.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PassengersUser(id: $id, avatar: $avatar, displayName: $displayName, firstName: $firstName, lastName: $lastName, gender: $gender, country: $country, city: $city, description: $description, isActivated: $isActivated)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PassengersUser &&
        other.id == id &&
        other.avatar == avatar &&
        other.displayName == displayName &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.gender == gender &&
        other.country == country &&
        other.city == city &&
        other.description == description &&
        other.isActivated == isActivated;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        avatar.hashCode ^
        displayName.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        gender.hashCode ^
        country.hashCode ^
        city.hashCode ^
        description.hashCode ^
        isActivated.hashCode;
  }
}
