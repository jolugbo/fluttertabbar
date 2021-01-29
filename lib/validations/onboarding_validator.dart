
//




//               OLUFEMI         ADETOLA             <bold!>JOLUGBO<bold!>




//

bool firstNameValidator(String firstname){
  if(firstname.isNotEmpty && firstname.length > 2){
    return true;
  }
  return false;
}
bool lastNameValidator(String lastname){
  if(lastname.isNotEmpty && lastname.length >= 2){
    return true;
  }
  return false;
}
bool phoneNumberValidator(String phoneNumber){
  if(phoneNumber.length >= 5){
    return true;
  }
  return false;
}

bool placeOfBirthValidator(String placeOfBirth){
  if(placeOfBirth.isNotEmpty && placeOfBirth.length > 2){
    return true;
  }
  return false;
}
bool stateOfOriginValidator(String stateOfOrigin){
  if(stateOfOrigin.isNotEmpty && stateOfOrigin.length >= 2){
    return true;
  }
  return false;
}
bool addressValidator(String address){
  if(address.length >= 8){
    return true;
  }
  return false;
}
bool dateOfBirthValidator(DateTime dateOfBirth){
  if(dateOfBirth.difference(DateTime.now().add(Duration(days: -6580 ))).inDays > 0){
    return false;
  }
  return true;
}