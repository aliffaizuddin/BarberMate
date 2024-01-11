import 'package:map_mvvm/view/viewmodel.dart';
import 'package:my_app/Configs/service_locator.dart';
import 'package:my_app/Login/Models/RegistrationModel.dart';
import 'package:my_app/Login/Services/Register_Service/RegisterService.dart';


class RegistrationViewModel extends Viewmodel {
  List<RegistrationModel> _register = [];
  final RegisterService _registerServices = locator();
  List<RegistrationModel> get register => _register;
  int get count => _register.length;

  Future<void> addNewUSer(RegistrationModel register) async {
    print(register.fullName);
    RegistrationModel added = await _registerServices.addUser(register);
    _register.add(added);
    update();
  }
}
