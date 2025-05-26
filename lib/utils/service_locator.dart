import 'package:get_it/get_it.dart';

import '../repository/music_service_repository.dart';
import '../view_model/music_service_view_model.dart';

final GetIt getIt = GetIt.instance;

void setupServiceLocator() {
  // Repository
  getIt.registerLazySingleton<MusicServiceRepository>(
    () => MusicServiceRepository(),
  );

  // ViewModel
  getIt.registerFactory<MusicServiceViewModel>(
    () => MusicServiceViewModel(getIt<MusicServiceRepository>()),
  );
}
