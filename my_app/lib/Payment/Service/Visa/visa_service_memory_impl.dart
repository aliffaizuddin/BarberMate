import 'package:my_app/Payment/Model/visaPayment_model.dart';
import 'package:my_app/Payment/Service/Visa/visa_service.dart';

class VisaServiceMemoryImpl implements VisaService
{
  

  @override
  Future<VisaModel> addPayment(String userId, double totalPayment, String date, String time, String paymentMethod) {
    // TODO: implement addPayment
    throw UnimplementedError();
  }
  
}