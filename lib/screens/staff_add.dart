import 'package:flutter/material.dart';
import 'package:untitled/models/staff.dart';
import 'package:untitled/validation/staff_validator.dart';

class StaffAdd extends StatefulWidget {

  List<Staff> staffs;
  StaffAdd(this.staffs);

  @override
  State<StatefulWidget> createState() {
    return _StaffAddState(staffs);
  }
}
class _StaffAddState extends State<StaffAdd> with StaffValidationMixin{
  List<Staff> staffs;
  var staff = Staff.withoutInfo();
  var formKey = GlobalKey<FormState>();

  _StaffAddState(this.staffs);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Yeni Personel Ekle"),
      ),
      body: Container(
        margin: EdgeInsets.all(20.0), // Kenarlardan 20 lik boşluk bırak.
         child: Form(
           key: formKey,
           child: Column(
             children: <Widget>[
              buildFirstNameField(),
               buildLastNameField(),
               buildGenderField(),
               buildSubmitButton(),
             /* onSaved: (String value){
                staff.firstName = value;
                },*/

             ],
           ),
         ),
      )
    );
  }

  Widget buildFirstNameField() {
    String value;
    return TextFormField(
      decoration: InputDecoration(labelText: "Personel adı", hintText: "Serkan"),
      //validator: validateFirstName,
      onSaved: (value){
        staff.firstName = value!;
      },
    );
  }
  Widget buildLastNameField() {
    String value;
    return TextFormField(
      decoration: InputDecoration(labelText: "Personel soyadı", hintText: "Özdemir"),
      onSaved: (value){
        staff.lastName = value!;
      },
    );
  }
  Widget buildGenderField() {
    String value;
    return TextFormField(
      decoration: InputDecoration(labelText: "Cinsiyet", hintText: "E"),
      onSaved: (value){
        //staff.gender = int.parse(value!);
        staff.gender = value!;
      },
    );
  }
  Widget buildSubmitButton(){
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
        if(formKey.currentState!.validate()){
          formKey.currentState!.save();
          staffs.add(staff);
          saveStaff();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStaff(){
    print(staff.firstName);
    print(staff.lastName);
    print(staff.gender);
  }

}
