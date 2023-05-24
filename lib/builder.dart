
class UserAccount{

   String? _firstName ;
   String? _lastName ;
   String? _email ;
   String? _password ;
   int? _phoneNumber;

   UserAccount(UserAccountBuilder builder){
      _firstName = builder._firstName;
      _lastName  = builder._lastName;
      _email  = builder._email;
      _password  = builder._password;
      _phoneNumber = builder._phoneNumber;
   }

   @override
   String toString(){
     return "UserAccount $_firstName, $_lastName, $_email,$_password,$_phoneNumber";
   }
}

class UserAccountBuilder{
  String? _firstName ;
  String? _lastName ;
  String? _email ;
  String? _password ;
  int? _phoneNumber;

  UserAccountBuilder(this._email,this._password,this._phoneNumber);
  String? get firstName => _firstName;
  void set firstName(String? value){
    _firstName = value;
  }
  String? get lastName => _lastName;
  void set lastName(String? value){
    _lastName = value;

  }
  UserAccount build(){
    return UserAccount(this);
  }


}









