import 'package:flutter_bloc/flutter_bloc.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(const LocationInitial()) {
    on<SetLocationEvent>((event, emit) {
      emit(LocationLoaded(event.locationState));
    });
  }
}
