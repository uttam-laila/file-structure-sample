
import 'dart:convert';
import 'package:folder_structure_example/models/userModel.dart';
import 'package:http/http.dart' as http;

class GetUsersList{
 Future<List<UserModel>> getUsers() async{
    var data = await http.get('http://www.json-generator.com/api/json/get/bPffBuyvuG?indent=2');
    var jsonData = json.decode(data.body);

    List<UserModel> users = [];
    for(var i in jsonData){
      // print(i['id']);
      UserModel userModel = new UserModel(i['id'], i['name'], i['avatar']);
      users.add(userModel);
    }
    return users;
  }
}
