import 'package:equatable/equatable.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object> get props => [];
}

class FetchLocationEvent extends LocationEvent {
  final String query;
  final double longitude;
  final double latitude;

  const FetchLocationEvent(this.query, this.longitude, this.latitude);

  @override
  List<Object> get props => [query, longitude, latitude];
}

class ResetLocationEvent extends LocationEvent {}
