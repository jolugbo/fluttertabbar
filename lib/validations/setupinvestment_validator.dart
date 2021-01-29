bool investmentNameValidator(String name){
  if(name.isNotEmpty && name.length > 2){
    return true;
  }
  return false;
}
bool investmentAmountValidator(double amount){
  if(amount >= 1000){
    return true;
  }
  return false;
}

bool InvestmentDateValidator(DateTime investmentEndDate){
  if(investmentEndDate == null){
    return false;
  }
  return true;
}