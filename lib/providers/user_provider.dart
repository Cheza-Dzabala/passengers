import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:passengers/models/passengers_user.dart';

final userProvider = StateProvider<PassengersUser>((_) => PassengersUser());
