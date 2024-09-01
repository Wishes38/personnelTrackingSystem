import 'package:flutter/material.dart';
import 'package:untitled/models/staff.dart';
import 'package:untitled/validation/staff_validator.dart';

class StaffEdit extends StatefulWidget {

  Staff selectedStaff;
  StaffEdit(this.selectedStaff);

  @override
  State<StatefulWidget> createState() {
    return _StaffAddState(selectedStaff);
  }
}
class _StaffAddState extends State<StaffEdit> with StaffValidationMixin{
  Staff selectedStaff;
  var formKey = GlobalKey<FormState>();

  _StaffAddState(this.selectedStaff);

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
                student.firstName = value;
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
      initialValue: selectedStaff.firstName,
      decoration: InputDecoration(labelText: "Personel adı", hintText: "Serkan"),
      //validator: validateFirstName,
      onSaved: (value){
        selectedStaff.firstName = value!;
      },
    );
  }
  Widget buildLastNameField() {
    String value;
    return TextFormField(
      initialValue: selectedStaff.lastName,
      decoration: InputDecoration(labelText: "Personel soyadı", hintText: "Özdemir"),
      onSaved: (value){
        selectedStaff.lastName = value!;
      },
    );
  }
  Widget buildGenderField() {
    String value;
    return TextFormField(
      initialValue: selectedStaff.gender.toString(),
      decoration: InputDecoration(labelText: "Cinsiyet", hintText: "E"),
      onSaved: (value){
       // selectedStaff.gender = int.parse(value!);
        selectedStaff.gender = value!;
      },
    );
  }
  Widget buildSubmitButton(){
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
        if(formKey.currentState!.validate()){
          formKey.currentState!.save();
          saveStudent();
          Navigator.pop(context);
        }
      },
    );
  }

  void saveStudent(){
    print(selectedStaff.firstName);
    print(selectedStaff.lastName);
    print(selectedStaff.gender);
  }

}
