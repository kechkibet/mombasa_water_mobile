import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class ServicesContoller extends GetxController {
  //9 new water lic
  void newLICBillDialog(BuildContext context)
  {
    final _formKey2 = GlobalKey<FormBuilderState>();
    // make get popup to activate acc
    RxString errorText = "".obs;
    Get.defaultDialog(title:"New LIC Water Bill",
      onCancel: (){Get.back();} ,
      content: SingleChildScrollView(
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
                              labelText: 'Enter Phone Number',
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
                        SizedBox(height: 10,),
                        FormBuilderTextField(
                          name: 'amount',
                          decoration: InputDecoration(
                              labelText: 'Enter Amount',
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
                        SizedBox(height: 10,),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
      onConfirm: () async
      {
        if (_formKey2.currentState?.saveAndValidate() == true) {

          Map data = _formKey2.currentState!.value;
          print("the data is ${data}");
          // save data
          Get.back();
        }
      },
    );
  }

  AppBar make_appBar(String title)
  {
    return AppBar(
      title: Text(title),
      centerTitle: true,
      backgroundColor: Colors.blueGrey,
      shadowColor: Colors.transparent,
    );
  }
}
