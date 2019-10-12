class UserModel {
  int _id;
  String _name;
  String _avatar;
  
  UserModel(this._id, this._name, this._avatar);

  set id(int id){
    this._id= id;
  }
  set name(String name){
    this._name= name;
  }
  set avatar(String avatar){
    this._avatar= avatar;
  }

  int get id => this._id;
  String get name => this._name;
  String get avatar => this._avatar;
}