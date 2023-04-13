part of 'location_bloc.dart';

abstract class LocationState {
  final String locationState;
  const LocationState(this.locationState);
}

class LocationInitial extends LocationState {
  const LocationInitial() : super('');
}

class LocationLoaded extends LocationState {
  const LocationLoaded(String locationState) : super(locationState);
}
