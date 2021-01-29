
//




//               OLUFEMI         ADETOLA             <bold!>JOLUGBO<bold!>




//

import 'package:project_x/models/strings.dart';

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
  if(phoneNumber.length >8){
    return true;
  }
  return false;
}

bool emailValidator(String email){
  final String emailPattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
  RegExp exp = new RegExp(emailPattern);
  if(exp.hasMatch(email)){
    return true;
  }
  return false;
}

PasswordValidationResp loginPasswordValidator(String password){
  PasswordValidationResp ErrorResp = PasswordValidationResp(0,'');
  ErrorResp.validated = 0;
  if (password.isEmpty || password.length <= 3) {
    ErrorResp.error = 'Password field Invalid';
    ErrorResp.validated = -1;
  }
  return ErrorResp;
}

PasswordValidationResp passwordValidator(String password){
  PasswordValidationResp ErrorResp = PasswordValidationResp(0,'');
  bool isLengthComplient = false;
  bool hasUppercase  = false;
  bool hasDigits = false;
  bool hasLowercase = false;
  bool hasSpecialCharacters = false;
  var character='';
  var i=0;
  if (! password?.isEmpty) {
    //hasSpecialCharacters = password.contains(new RegExp(r'[!@#$%^&*(),.?":{}|<>]'));
    while (i < password.length){
      character = password.substring(i,i+1);
      if (isDigit(character , 0)){
        hasDigits=true;
      }
      else{
        if (character == character.toUpperCase()) {
          hasUppercase=true;
        }
        if (character == character.toLowerCase()){
          hasLowercase=true;
        }
      }
      i++;
    }
  }
  if(hasLowercase)
   ErrorResp.validated++;
  if(hasUppercase)
    ErrorResp.validated++;
  if(hasDigits)
    ErrorResp.validated++;
  if(password.length >= 8)
    ErrorResp.validated++;

  if(!hasLowercase){
    ErrorResp.error = password_error_small_letter;
    return ErrorResp;
  }
  if(!hasUppercase){
    ErrorResp.error = password_error_capital_letter;
    return ErrorResp;
  }
  if(!hasDigits){
    ErrorResp.error = password_error_digit;
    return ErrorResp;
  }
  if(!(password.length >= 8)){
    ErrorResp.error = password_error_length;
    return ErrorResp;
  }
  else{
    ErrorResp.error = '';
    return ErrorResp;
  }
}

bool isDigit(String s, int idx) =>
    "0".compareTo(s[idx]) <= 0 && "9".compareTo(s[idx]) >= 0;

class PasswordValidationResp{
  int validated;
  String error;
  PasswordValidationResp(this.validated,this.error);
}