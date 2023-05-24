import 'package:first_project/getx_button_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GetxRadioButton extends StatefulWidget {
  const GetxRadioButton({Key? key}) : super(key: key);

  @override
  State<GetxRadioButton> createState() => _GetxRadioButtonState();
}

class _GetxRadioButtonState extends State<GetxRadioButton> {
  @override
  Widget build(BuildContext context) {
   Get.put(ButtonController());
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        height: 500,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OrderTypeButton(value: "take_away", title: "take away", amount: 10, isFree: true),
              OrderTypeButton(value: "home_delivery", title: "home delivery", amount: 10, isFree: false),
            ],
          ),
      ),
    );
  }
}


class OrderTypeButton extends StatelessWidget {
  final String value;
  final String title;
  final double amount;
  final bool isFree;

  const OrderTypeButton({

    required this.value,
    required this.title,
    required this.amount,
    required this.isFree,});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ButtonController>(
      builder: (buttonController){
        return InkWell(
          onTap:()=> buttonController.setOrderType(value),
          child: Row(
            children: [
              Radio(
                  value: value,
                  groupValue: buttonController.orderType,
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onChanged:null,
                 activeColor:Theme.of(context).primaryColor,
              ),
              const SizedBox(width:  10),
              
              Text(title,),
              const SizedBox(width: 5),
              Text('(${(value == 'take_away'|| isFree)?'free':amount!=-1?'\$${amount/10}':'calculating'})')
            ],
          ),
        );
      }
    );
  }
}
