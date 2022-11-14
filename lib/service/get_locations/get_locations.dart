import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class GetLocations{
  Future<Position?> getLocations()async{
    var perm = await Geolocator.checkPermission();
    if(perm == LocationPermission.denied){
      return null;
    }
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    ).catchError((e){
      print(e);
    });
  }
}
class GetCityName{
  Future<String?> getCityName({required Position position})async{
    if(position.isMocked){
      return null;
    }
    List<Placemark> placeMarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );
    return placeMarks[0].administrativeArea;
  }
}