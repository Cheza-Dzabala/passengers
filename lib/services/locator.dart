import 'package:get_it/get_it.dart';
import 'package:passengers/services/firebase/authentication.dart';
import 'package:passengers/services/firebase/onboarding_service.dart';

GetIt locator = GetIt.instance;

// initialize getIt

void setUpServiceLocator() {
  locator.registerLazySingleton<AuthenticationService>(
      () => AuthenticationService());
  locator.registerLazySingleton<OnboardingService>(() => OnboardingService());
}
