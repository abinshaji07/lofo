import 'package:dio/dio.dart';

class LocationServices {
  Future<String> geoCodeFromCoordinates(double lat, double lon) async {
    String location = "NO DATA";
    try {
      var response =
          await Dio().get('https://geocode.maps.co/reverse?lat=$lat&lon=$lon');
      location = response.data['address']['county'];
    } catch (e) {
      print(e);
    }
    return location;
  }
}