import 'package:firebase_database/firebase_database.dart';

class UserModel {
  int? points;
  String? name;

  UserModel({this.points});

  UserModel.fromSnapshot(DataSnapshot snap){
    points =( snap.value as dynamic)['points'];
    name =( snap.value as dynamic)['name'];
  }
}