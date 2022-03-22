import 'package:get_it/get_it.dart';
import 'package:passengers/services/fileUpload.service.dart';
import 'package:passengers/services/profile.service.dart';

import 'authentication.service.dart';

GetIt locator = GetIt.instance;

// initialize getIt

void setUpServiceLocator() {
  locator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationService());
  locator.registerLazySingleton<ProfileService>(() => ProfileService());
  locator.registerLazySingleton<FileUploadService>(() => FileUploadService());
}
