import 'package:equatable/equatable.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationIsLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final String location;

  const LocationLoaded(this.location);

  @override
  List<Object> get props => [location];
}

class LocationIsNotLoading extends LocationState {}
