import 'package:appwrite/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passengers/models/profile.model.dart';

final profileProvider = StateProvider<Profile>((_) => Profile());
final userProvider = StateProvider<User>(
  (_) => User(
    $id: '0',
    name: '',
    registration: 0,
    status: false,
    passwordUpdate: 0,
    email: '',
    emailVerification: false,
    prefs: Preferences(data: {}),
  ),
);

final sessionProvider = StateProvider<Session>(
  (_) => Session(
    $id: '',
    userId: '',
    expire: 0,
    provider: '',
    providerUid: '',
    providerAccessToken: '',
    providerAccessTokenExpiry: 0,
    providerRefreshToken: '',
    ip: '',
    osCode: '',
    osName: '',
    osVersion: '',
    clientType: '',
    clientCode: '',
    clientName: '',
    clientVersion: '',
    clientEngine: '',
    clientEngineVersion: '',
    deviceName: '',
    deviceBrand: '',
    deviceModel: '',
    countryCode: '',
    countryName: '',
    current: false,
  ),
);
