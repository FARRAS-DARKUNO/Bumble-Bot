part of 'location_bloc.dart';

abstract class LocationEvent {}

class SetLocationEvent extends LocationEvent {
  final String locationState;
  SetLocationEvent(this.locationState);
}
