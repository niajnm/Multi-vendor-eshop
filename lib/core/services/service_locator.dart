
// final serviceLocator = GetIt.instance;

// class ServiceLocator {
//   static Future<void> setUpServiceLocator() async {
//     serviceLocator.registerLazySingleton<PreferenceManager>(
//         () => PreferenceManagerImpl());

// // initialization
//     serviceLocator
//         .registerLazySingleton<AuthRemoteSource>(() => AuthRemoteSourceImpl());
//     serviceLocator.registerLazySingleton<AuthRepository>(
//         () => AuthRepositoryImpl(serviceLocator()));

//     serviceLocator.registerLazySingleton<ProductListRepository>(
//         () => ProductListRepositoryImpl(serviceLocator()));
//   }
// }
