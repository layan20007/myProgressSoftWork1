import 'package:get/get.dart';

class ButtonController extends GetxController{
  String _orderType ='home delivery';
  String get orderType => _orderType ;

  void setOrderType(String type) {
    _orderType = type;
    print("order type is:"+orderType);
    update();
  }
}