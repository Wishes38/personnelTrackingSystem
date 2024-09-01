class StaffValidationMixin{
   validateFirstName(String value){
    if(value.length<2){
      return "İsim en az iki karakter olmalıdır";
    }
    else{
      return "";}
  }

   validateLastName(String value) {
     if (value.length < 2) {
       return "Soyad en az iki karakter olmalıdır";
     }
     else {
       return "";
     }
   }

     validateGenderName(String value) {
       if (value!= "E" || value!= "K") {
         return "Cinsiyet E yada K şeklinde girilmelidir";
       }
       else {
         return "";
       }
     }
   }