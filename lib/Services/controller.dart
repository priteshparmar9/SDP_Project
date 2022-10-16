import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get_storage/get_storage.dart';

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

}
