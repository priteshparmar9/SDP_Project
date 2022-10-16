import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sdp_project/models/flights.dart';

class Controller extends GetxController {
  final box = GetStorage();
  bool IsLoggedIn() {
    return box.read('isLoggedIn') ?? false;
  }
  void setLogin(email){
    box.write('isLoggedIn', true);
    box.write('email', email);
  }
  bool IsAdmin(){
    return (box.read('email') == 'admin');
  }

  void logout(){
    box.erase();
    return;
  }

  void setFlightId(id){
    box.write('id', id);
    return;
  }

  Flight getFlightId() {
    return box.read('id');
  }
}
