import 'dart:async';

import 'package:folder_structure_example/models/userModel.dart';
// import 'package:folder_structure_example/pages/homePage.dart';
import 'package:logger/logger.dart';

class AccepedListBloc {

  List<UserModel> accepedList = [];

  final _listController = StreamController<List<UserModel>>();

  final _accepted = StreamController<UserModel>();

  Stream<List<UserModel>> get acceptedListStream => _listController.stream;
  StreamSink<List<UserModel>> get acceptedListSink => _listController.sink;

  Stream<UserModel> get acceptedUserModelStream => _accepted.stream;
  StreamSink<UserModel> get acceptedUserModelSink => _accepted.sink;

  AccepedListBloc(){
    _listController.add(accepedList);

    _accepted.stream.listen(_acceptedList);
    
  }

  void dispose(){
    _listController.close();
    _accepted.close();
  }

  var logger = new Logger();

  void _acceptedList(UserModel user) {
    logger.e(user.id);
    accepedList.add(user);
  }
}