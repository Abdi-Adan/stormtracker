import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stormtracker/blocs/location/location_events.dart';
import 'package:stormtracker/blocs/location/location_state.dart';
import 'package:stormtracker/data/repositories/location_repository.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationRepo _locationRepo = LocationRepo();

  LocationBloc() : super(LocationIsLoading()) {
    on<FetchLocationEvent>((event, emit) async {
      try {
        String currentLocation =
            await _locationRepo.getNearestCity(event.latitude, event.longitude);
        emit(LocationLoaded(currentLocation));
      } catch (_) {
        emit(LocationIsNotLoading());
      }
    });
  }
}
