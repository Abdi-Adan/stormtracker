class LocationModel {
  final double cityName;
  final double longitude;
  final double latitude;

  LocationModel({
    required this.cityName,
    required this.longitude,
    required this.latitude,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    LocationModel locationModel = LocationModel(
      cityName: json['location']['city'],
      latitude: json['location']['latitude'],
      longitude: json['location']['longitude'],
    );
    return locationModel;
  }
}
