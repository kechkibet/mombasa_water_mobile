import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:mombasa_water/pages/services/services_controller.dart';
import 'package:mombasa_water/style/hint_text_style.dart';

class PayPage extends GetView {
  final _formKey2 = GlobalKey<FormBuilderState>();
  // make get popup to activate acc
  RxString errorText = "".obs;
  ServicesContoller servicesController = Get.find<ServicesContoller>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: servicesController.make_appBar("Pay Bill"),
      body: SingleChildScrollView(
        child: Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Obx(
                      () => FormBuilder(
                    key: _formKey2,
                    child: Column(
                      children: [
                        FormBuilderTextField(
                          name: 'phone',
                          decoration: InputDecoration(
                              hintText: 'Enter Phone Number',
                              hintStyle: myHintStyle(),
                              border: OutlineInputBorder(),
                              errorText: errorText.value.length > 0
                                  ? errorText.value
                                  : null),
                          onChanged: (String ?val) {
                            errorText.value = '';
                          },
                          // valueTransformer: (text) => num.tryParse(text),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context)
                          ]),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 20,),
                        FormBuilderTextField(
                          name: 'amount',
                          decoration: InputDecoration(
                              hintText: 'Enter Amount',
                              hintStyle: myHintStyle(),
                              border: OutlineInputBorder(),
                              errorText: errorText.value.length > 0
                                  ? errorText.value
                                  : null),
                          onChanged: (String ?val) {
                            errorText.value = '';
                          },
                          // valueTransformer: (text) => num.tryParse(text),
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(context),
                            FormBuilderValidators.numeric(context)
                          ]),
                          keyboardType: TextInputType.number,
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: Get.width,
                          child: ElevatedButton(
                            style: myButtonStyle(),
                            child: Text("Pay",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  fontSize: 17,
                                  color: Colors.white
                              ),
                            ),
                            onPressed: (){pay();},),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),

    );
  }

  void pay()
  {
    if(_formKey2.currentState?.saveAndValidate() == true) {
        Map data = _formKey2.currentState!.value;
        print("the data is ${data}");
        // save data
        Get.back();
      }
  }
}

