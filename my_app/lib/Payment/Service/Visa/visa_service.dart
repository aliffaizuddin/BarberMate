import 'package:my_app/Payment/Model/visaPayment_model.dart';

abstract class VisaService 
{
   Future<VisaModel> addPayment( String userId,
    double totalPayment,
    String date,
    String time,
    String paymentMethod,); 
}