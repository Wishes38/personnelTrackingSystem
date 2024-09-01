class Staff {
  late int id;
  late String firstName;
  late String lastName;
  late String gender;

  Staff.withId(int id,String firstName, String lastName, String gender) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.gender = gender;
  }

  Staff(String firstName, String lastName, String gender) {
    this.firstName = firstName;
    this.lastName = lastName;
    this.gender = gender;
  }

  Staff.withoutInfo(){

  }

  String get getFirstName{
    return "PRS - " + this.firstName;
  }

  void set setFirstName(String value){
    this.firstName = value;
  }

 /* String get getStatus{
    String message = "";
    if (this.gender == "E" && this.gender == "e" && this.gender=="Erkek" && this.gender=="erkek" && this.gender=="ERKEK") {
      message = "Erkek";
    } else if(this.gender == "K" && this.gender == "k" && this.gender=="Kadın" && this.gender=="kadın" && this.gender=="KADIN"){
      message = "Kadın";
    }
    else{}
    return message;
  }*/
}