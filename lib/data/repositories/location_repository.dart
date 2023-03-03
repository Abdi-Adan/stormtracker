// ignore_for_file: prefer_adjacent_string_concatenation, prefer_interpolation_to_compose_strings
import 'package:http/http.dart' as http;
import 'dart:convert';

class LocationRepo {
  var apiKey = 'fsq3RUZiEP8ptoA3vvEJxW0QKDqzv9Bn0GjA29ANwBmu7GI=';
  var clientId = 'A4QRFLIGTJ3TCOWOOITCRU0KPECDRF40R0BSD0MPLLA2DEYQ';
  var clientSecret = 'CXN3ZGE20JQRHVJVDA3E14NBSYUS5FL0WGPTFWW10TO3SJJ5';

  Future<String> getNearestCity(double latitude, double longitude) async {
    // construct the API request URL
    String apiUrl = 'https://api.foursquare.com/v3/venues/search' +
        '?ll=$latitude,$longitude' +
        '&intent=checkin' +
        '&radius=100000' +
        '&limit=1' +
        '&client_id=$clientId' +
        '&client_secret=$clientSecret' +
        '&v=20220301';

    // send the API request and get the response
    var response = await http.get(Uri.parse(apiUrl));

    // decode the JSON response
    var data = json.decode(response.body);

    // extract the city name from the response
    String cityName = data['response']['venues'][0]['location']['city'];

    return cityName;
  }
}
