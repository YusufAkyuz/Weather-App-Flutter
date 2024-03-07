import 'package:geolocator/geolocator.dart';

class Location {
  late final double latitude;
  late final double longitude;

  //Eğer ilk operand null değilse, ?? operatörü ilk operandı döndürür.
  // Eğer ilk operand null ise, ?? operatörü ikinci operandı döndürür.


  Future<void> getCurrentLocation() async {
    LocationPermission permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.denied) {
      // The user denied location permissions. You can handle this case here.
      print("Location permissions denied.");
    } else if (permission == LocationPermission.deniedForever) {
      // The user denied location permissions permanently. You can handle this case here.
      print("Location permissions denied forever.");
    } else {
      try {
        Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high,
        );
        latitude = position.latitude;
        longitude = position.longitude;
      }catch(e){
        print(e);
      }
    }
  }
}