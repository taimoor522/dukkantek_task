import 'package:dukkantek_task_taimoor/src/features/events/data/datasources/local_client.dart';
import 'package:dukkantek_task_taimoor/src/features/events/data/datasources/remote_client.dart';
import 'package:dukkantek_task_taimoor/src/features/events/data/models/latlng_model.dart';
import 'package:dukkantek_task_taimoor/src/features/events/data/repositories/events_repository_impl.dart';
import 'package:dukkantek_task_taimoor/src/features/events/domain/repositories/base_local_client.dart';
import 'package:dukkantek_task_taimoor/src/features/events/domain/repositories/base_remote_client.dart';
import 'package:dukkantek_task_taimoor/src/features/events/domain/repositories/events_repository.dart';
import 'package:dukkantek_task_taimoor/src/features/events/domain/usecases/add_to_favorite.dart';
import 'package:dukkantek_task_taimoor/src/features/events/domain/usecases/get_events.dart';
import 'package:dukkantek_task_taimoor/src/features/events/domain/usecases/get_favotite_events.dart';
import 'package:dukkantek_task_taimoor/src/features/events/domain/usecases/remove_from_favorite.dart';
import 'package:get_it/get_it.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'features/events/data/models/address_model.dart';
import 'features/events/data/models/events_model.dart';
import 'features/events/data/models/performer_model.dart';
import 'features/events/presentation/state/event_cubit.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  var path = (await getApplicationDocumentsDirectory()).path;
  Hive
    ..init(path)
    ..registerAdapter(EventModelAdapter())
    ..registerAdapter(AddressModelAdapter())
    ..registerAdapter(PerformerModelAdapter())
    ..registerAdapter(LatLngModelAdapter());
  injector.registerSingleton<BaseLocalClient>(LocalClient());
  injector.registerSingleton<BaseRemoteClient>(RemoteClient());

  injector.registerSingleton<EventRepository>(EventsRepositoryImpl(
    remoteClient: injector(),
    localClient: injector(),
  ));
  injector.registerLazySingleton<GetEventUseCase>(() => GetEventUseCase(injector()));
  injector.registerLazySingleton<AddToFavoriteUseCase>(() => AddToFavoriteUseCase(injector()));
  injector.registerLazySingleton<RemoveFromFavoriteUseCase>(
      () => RemoveFromFavoriteUseCase(injector()));
  injector
      .registerLazySingleton<GetFavoriteEventsUseCase>(() => GetFavoriteEventsUseCase(injector()));

  injector.registerFactory<EventCubit>(() => EventCubit(
        getFavoriteEventsUseCase: injector(),
        addToFavoriteUseCase: injector(),
        removeFromFavoriteUseCase: injector(),
        getEventUseCase: injector(),
      ));
}
